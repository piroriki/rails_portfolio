class Form::User < User
    REGISTRABLE_ATTRIBUTES = %i(id name email password password_confirmation)

    has_many :group, class_name: 'Form::Group'

end