class FileTasks < Volt::TaskHandler

  def directory_listing(path)
    result = []
    Dir.glob("#{path}*") { |file| result << {full_path: file, basename: File.basename(file)} if File.directory?(file) }
    result.sort { |a, b| _a = a[:basename]; _b = b[:basename]; _a < _b ? -1 : (_a > _b ? 1 : 0) }
  end

end
