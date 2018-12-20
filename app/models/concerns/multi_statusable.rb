# rails g migration addMultiStatusToModel multi_status:string
# rails g migration addAbcToModel abc:string
# include MultiStatusable
# has_multi_status :multi_status, ['wap', 'pc']
# has_multi_status :abc, ['a', 'b', 'c']
# ----
# how get real_val: eg: abc => Model.first.abc_before_type_cast
module MultiStatusable
  def self.included(klass)
    klass.class_eval do
      # class methods
      class << self
        def has_multi_status column, multi_status_values, max_length = 6
          singleton_class.send :define_method, "#{column}" do |statuses|
            real_val = multi_status_values.map { |status| statuses.include?(status) ? '1' : '_' }.join('').ljust(max_length, '0')
            if block_given?
              yield real_val
            else
              where("#{column} like ?", real_val)
            end
          end

          define_method "#{column}" do
            return [] if super().blank?
            super().split('').map.with_index{|v, i| v == '1' && multi_status_values[i] || nil}.compact
          end

          define_method "#{column}=" do |statuses|
            super(multi_status_values.map{ |status| statuses.include?(status) ? '1' : '0'}.join('').ljust(max_length, '0'))
          end

        end
      end
    end
  end
end