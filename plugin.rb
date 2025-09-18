# name: discourse-topic-custom-fields
# about: Locales and hreflang fields for chosen categories
# version: 0.6
# authors: IDW
# url: https://github.com/zamozhnii/discourse-topic-custom-fields.git

enabled_site_setting :enable_discourse_topic_custom_fields

after_initialize do
  Discourse::Application.routes.append do
    put "/alts-x-def-topic/:topic_id/custom_fields" => "topic_custom_fields#update"
  end

  class ::TopicCustomFieldsController < ::ApplicationController
    requires_plugin 'discourse-topic-custom-fields'
    before_action :ensure_logged_in

    def update
      topic = Topic.find(params[:topic_id])
      guardian.ensure_can_edit!(topic)

      topic.custom_fields.merge!(params[:topic_custom_fields].permit!.to_h)
      topic.save!

      render json: success_json
    end
  end
end