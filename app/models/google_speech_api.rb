class GoogleSpeechAPI
  require "google/cloud/speech"
  include Singleton

  PROJECT_ID = "kakiokoshi-chan".freeze
  AUDIO_DIR  = Rails.root.join("tmp", "audio")

  def initialize
    @speech = Google::Cloud::Speech.new(project: PROJECT_ID)
  end

  def transcript
    audio_file_name = "#{AUDIO_DIR}/0101001.wav"
    audio = @speech.audio(audio_file_name,
                          encoding: :linear16,
                          sample_rate: 44100,
                          language: "ja")

    results = audio.recognize
    results.first.transcript
  end
end
