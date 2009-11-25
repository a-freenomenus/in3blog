# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def mp3_player(mp3, options = {})
    show_loading = options[:show_loading] || 'always'
    show_volume = options[:show_volume] || 1
    %(
      <object type="application/x-shockwave-flash" data="/player/player_mp3_maxi.swf" width="200" height="20">
        <param name="movie" value="player_mp3_maxi.swf" />
        <param name="FlashVars" value="mp3=#{mp3}&showvolume=#{show_volume}&showloading=#{show_loading}" />
      </object>
    )
  end

end
