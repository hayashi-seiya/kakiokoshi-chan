class AudiosController < ApplicationController
  def index
  end

  def upload
    uploaded_file = fileupload_param[:file]
    output_path = Rails.root.join("tmp", "audio", uploaded_file.original_filename)

    File.open(output_path, "w+b") do |file|
      file.write(uploaded_file.read)
    end

    if File.exist?(output_path)
      flash[:success] = "【#{uploaded_file.original_filename}】をアップロードしました。"
      redirect_to root_path
    else
      flash[:warning] = "ファイルをアップロードできませんでした。"
      render :upload
    end
  end

  private

    def fileupload_param
      params.require(:fileupload).permit(:file)
    end
end
