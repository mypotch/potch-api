namespace :fixs do
  namespace :categories do
    task fix_position: :environment do
      Category.roots.each.with_index(1) do |category, index|
        category.update_column :position, index
      end
    end

    task fix_children_position: :environment do
      def fix_children category
        category.children.each.with_index(1) do |cate, index|
          cate.update_column :position, index

          if cate.children.present?
            fix_children cate
          end
        end
      end
      Category.roots.each do |category|
        fix_children category
      end
    end
  end
end