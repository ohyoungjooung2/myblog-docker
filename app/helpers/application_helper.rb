module ApplicationHelper
 #Create a submit button with the vgiven name with a cancel link
 #Accepts two arguments: Form object and the cancel link name
 def admin?
   current_user.admin?
 end

 def submit_or_cancel(form,name='Cancel')
    form.submit + " or " +
         link_to(name,'javascript:history.go(-1);',:remote => true,:class => 'Cancel')
 end
end
