class GoogleSpeechAPI
  require "google/cloud/speech"
  include Singleton

  PROJECT_ID = "kakiokoshi-chan"

  def initialize
    @speech = Google::Cloud::Speech.new(project: PROJECT_ID)
  end
end
