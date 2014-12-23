class MainController < Volt::ModelController

  def index
  end

  def settings
    -> { FileTasks.directory_listing(page._new_music_path).then { |result| page._list = result } }.watch!
  end

  private

  def add_path(collection_name)
    collection = page.send(collection_name)
    unless page._new_music_path.empty?
      collection << { name: page._new_music_path, created_at: Time.now }
    end
    page._new_music_path = ''
  end

  def delete_path(collection_name, path)
    page.send(collection_name).delete path
  end

  # The main template contains a #template binding that shows another
  # template.  This is the path to that template.  It may change based
  # on the params._controller and params._action values.
  def main_path
    params._controller.or('main') + '/' + params._action.or('index')
  end

  # Determine if the current nav component is the active one by looking
  # at the first part of the url against the href attribute.
  def active_tab?
    url.path.split('/')[1] == attrs.href.split('/')[1]
  end
end
