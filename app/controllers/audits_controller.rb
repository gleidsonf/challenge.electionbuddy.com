# frozen_string_literal: true

class AuditsController < ApplicationController
  before_action :authenticate_user!

  def index
    audits = Audit.all.order(created_at: :desc)
    @serialized_audits = ActiveModelSerializers::SerializableResource.new(
      audits,
      each_serializer: AuditSerializer
    ).as_json
  end

  def show
    audit = Audit.find(params[:id])
    @serialized_audit = AuditSerializer.new(audit).as_json
  end
end
