class @Media extends MongoModel
  extraAttributes: ->
    @SE = if @season? and @episode
      "S#{@season.padLeft(2)}E#{@episode.padLeft(2)}"
    else if @episode
      "E#{@episode.padLeft(2)}"
