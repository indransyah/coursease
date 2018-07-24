ActiveAdmin.register Course do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :title, :description, :price, :status, :image
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

index do
  id_column
  column :title
  column :description
  column :price
  column :status
  column :image do |course|
    course.image.present? ? 'Yes' : 'No'
  end
  actions
end

form(){ |f|
  f.inputs(){
    f.input(:title)
    f.input(:description)
    f.input(:price)
    f.input(:status, as: :select, collection: ['Active', 'Not Active'], include_blank: false)
    f.input(:image, hint: course.image.present? ? image_tag(course.image, height: 300) : content_tag(:span, 'No Image'))
  }
  f.actions()
}

show(){
  attributes_table(){
    row :title
    row :description
    row(:price){
      number_to_currency(course.price)
    }
    row :status
    row(:image){
      course.image.present? ? image_tag(course.image, height: 300) : content_tag(:span, 'No Image')
    }
  }
}

end
