module IdeasHelper
  def build_idea_map (idea_id)
    # get the sub ideas so we can later find out their maps
    subideas = Subidea.where(:idea_id => idea_id)
        
    # create the map hash
    map = {
      # first column
      1 => {
          1 => '<img src="/images/map_ico_blank.png" />', 
          2 => '<img src="/images/map_ico_blank.png" />',
          3 => '<img src="/images/map_ico_blank.png" />',
          4 => '<img src="/images/map_ico_blank.png" />',
          5 => '<img src="/images/map_ico_blank.png" />'},
      
      2 => {
          1 => '<img src="/images/map_ico_blank.png" />', 
          2 => '<img src="/images/map_ico_blank.png" />',
          3 => '<a href="/subideas/new/123w' + String(idea_id) + '"><img src="/images/map_ico_addW.png"  title="New Medium Idea" /></a>',
          4 => '<img src="/images/map_ico_blank.png" />',
          5 => '<img src="/images/map_ico_blank.png" />'},
      
      3 => {
          1 => '<img src="/images/map_ico_blank.png" />', 
          2 => '<a href="/subideas/new/232n' + String(idea_id) + '"><img src="/images/map_ico_SaddN.png" title="New Small Idea" /></a>',
          3 => '<a href="/ideas/' + String(idea_id) + '"><img src="/images/map_ico_main.png" title="View Big Idea" /></a>',
          4 => '<a href="/subideas/new/234s' + String(idea_id) + '"><img src="/images/map_ico_SaddS.png" title="New Small Idea" /></a>',
          5 => '<img src="/images/map_ico_blank.png" />'},
      
      4 => {
          1 => '<img src="/images/map_ico_blank.png" />', 
          2 => '<img src="/images/map_ico_blank.png" />',
          3 => '<a href="/subideas/new/143e' + String(idea_id) + '"><img src="/images/map_ico_addE.png" title="New Medium Idea" /></a>',
          4 => '<img src="/images/map_ico_blank.png" />',
          5 => '<img src="/images/map_ico_blank.png" />'},
          
      #last column don't forget to end the commas and double check some things like brackets
      5 => {
          1 => '<img src="/images/map_ico_blank.png" />', 
          2 => '<img src="/images/map_ico_blank.png" />',
          3 => '<img src="/images/map_ico_blank.png" />',
          4 => '<img src="/images/map_ico_blank.png" />',
          5 => '<img src="/images/map_ico_blank.png" />'}
    }
    
    subideas.each do |si|
      # get the vars we need
      w = si.map.cellw
      h = si.map.cellh
      dir = si.map.dir.upcase
      ico_type = si.map.ico_type
      
      # figure out the new addition buttons if it is type 1
      case ico_type
      when 1
        # make top and bottom adds
        top = Integer(h) + 1        
        bottom = Integer(h) - 1
        
        # set the south and north addition buttons
        map[Integer(w)][Integer(top)] = '<a href="/subideas/new/2' + String(w) + String(top) + 's' + String(idea_id) + '/' + String(si.id) + '"><img src="/images/map_ico_SaddS.png" title="New Small Idea" /></a>'        
        map[Integer(w)][Integer(bottom)] = '<a href="/subideas/new/2' + String(w) + String(bottom) + 'n' + String(idea_id) + '/' + String(si.id) + '"><img src="/images/map_ico_SaddN.png" title="New Small Idea" /></a>'
        
        # create the different addition buttons        
        case dir
        when "E"
          side = Integer(w) + 1
        when "W"
          side = Integer(w) - 1          
        end
        map[Integer(side)][Integer(h)] = '<a href="/subideas/new/2' + String(side) + String(h) + String(dir) + String(idea_id) + '/' + String(si.id) + '"><img src="/images/map_ico_Sadd' + String(dir) + '.png" title="New Small Idea" /></a>'
        
        # create the submain idea icon
        map[Integer(w)][Integer(h)] = '<a href="/subideas/' + String(si.id) + '"><img src="/images/map_ico_submain.png" /></a>'
      when 2
        # create the sub sub idea icon
        map[Integer(w)][Integer(h)] = '<a href="/subideas/' + String(si.id) + '"><img src="/images/map_ico_Ssub' + dir + '.png" /></a>'
      end     
      # end of the each
    end
           
    # begin building the table 
    html = '' 
    html += '<table>'

    b = 1                                                           # define the b var which are the rows
    until b > 5                                                     # count from 1-5 for the rows
      html += '<tr>'
        a = 1                                                       # define the a var which are the columns
        until a > 5                                                 # count from 1-5 for the columns
          html += '<td>'+ map[Integer(a)][Integer(b)] +'</td>'
          a += 1                                                    # but of course we must increment
        end
      html += '</tr>'
      b += 1                                                        # increment some more cause we're cool like that
    end
    html += '</table>'
    
    # spit out the raw html
    raw html
  end
end
