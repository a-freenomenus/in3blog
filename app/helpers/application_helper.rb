# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def mp3_player(mp3, options = {})
    show_loading = options[:show_loading] || 'always'
    show_volume = options[:show_volume] || 1
    %(
      <object type="application/x-shockwave-flash" data="/player/player_mp3_maxi.swf" width="200" height="20">
        <param name="movie" value="/player/player_mp3_maxi.swf" />
        <param name="FlashVars" value="mp3=#{mp3}&showvolume=#{show_volume}&showloading=#{show_loading}" />
      </object>
    )
  end

  def cut(text, url)
    regexp = /\<cut\>(.*)\<\/cut\>/
    mdata = regexp.match(text)
    if mdata
      cut_text = regexp.match(text)[1]
      cut_pos = mdata.begin(0)
      chars = text.mb_chars
      chars[0..cut_pos - 1] + link_to(cut_text, url)
    else
      text
    end
  end

  def strip_cut(text)
    text.gsub(/\<cut\>.*\<\/cut\>/, '')
  end

  def link_to_admin
    if @controller.kind_of? Admin::AdminController
      link_to 'Back to blog', root_path
    else
      link_to 'To admin area', admin_root_path
    end
  end

end
