module UsersHelper

    
    def show_user_dashboard
        role = @current_user.role

        return tag.p 'I have not been verified as an Employee yet!' unless @current_user.verified

            case role
            when 'Supervisor'
                tag.p 'I can do/view/approve Everything!'
            when 'Lead'
                tag.p 'I can do most things'
                link_to 'Receiving', 
            when 'Project Manager'
                tag.p 'I can only view things'
            when 'Employee'
                tag.p 'I can only add my own things'
            else
                tag.p 'Do NOT know how you got this far without a role.  Go back and get yourself one before continuing'
            end
    end
end