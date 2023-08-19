class AuditSerializer < ActiveModel::Serializer

  attributes :id, :auditable_type, :auditable_id, :user_id

  attribute :created_at do
    object.created_at.strftime('%d/%m/%Y %H:%M:%S')
  end

  attribute :user_email do
    object.user.email
  end

  # TODO Serialize with their respective auditable_type
  attribute :changes do
    object.auditable_changes.map do |attribute, changes|
      {
        attribute: attribute,
        previous: changes[0],
        current: changes[1]
      }
    end
  end
end
