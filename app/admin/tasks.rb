ActiveAdmin.register Task do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :course_id, :title, :description, :video_url, :image
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
  column :course
  column :title
  column :description
  column :video_url
  column :image do |task|
    task.image.present? ? 'Yes' : 'No'
  end
  actions
end

form(){ |f|
  f.inputs(){
    f.input(:course)
    f.input(:title)
    f.input(:description)
    f.input(:video_url)
    f.input(:image, hint: task.image.present? ? image_tag(task.image, height: 300) : content_tag(:span, 'No Image'))
  }
  f.actions()
}

show(){
  attributes_table(){
    row :course
    row :title
    row :description
    row :video_url
    row(:image){
      task.image.present? ? image_tag(task.image, height: 300) : content_tag(:span, 'No Image')
    }
  }
}

end
