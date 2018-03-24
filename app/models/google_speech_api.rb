class GoogleSpeechAPI
  require "google/cloud/speech"
  include Singleton

  PROJECT_ID = "kakiokoshi-chan".freeze

  def initialize
    @speech = Google::Cloud::Speech.new(project: PROJECT_ID)
  end

  def transcript
    audio_dir = Rails.root.join("tmp", "audio")
    audio_file_name = "#{audio_dir}/0101001.wav"
    audio = @speech.audio(audio_file_name,
                          encoding: :linear16,
                          sample_rate: 44100,
                          language: "ja")

    results = audio.recognize
    results.first.transcript
  end
end
