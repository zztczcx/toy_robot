class Robot
  FACE_ARC= {EAST: 0, NORTH: 90, WEST: 180, SOUTH: 270}
  def initialize(t)
    @table = t
    @arc = 0 #弧度
  end

  def input(cmds)
    # the first valid command is a PLACE command
    if cmds[0][0] != :place then
      raise "first cmd should be a PLACE"
    end

    cmds.each do |cmd|
      command(cmd)
    end
  end

  def command(cmd)
    self.send *cmd
  end

  def place(x, y, f)
    # 判读参数合法性
    if @table.is_in(x, y) == true 
      @x=x
      @y=y
      @f=f # face, NORTH, SOUTH, EAST, WEST, 这个可以用symboy类型，或者常量？
      @arc=FACE_ARC[f]
    end

    #ignore
  end

  def move
    # 判断是否可以move , 或者当x, y 超出临界值时，不做修改
    oldx, oldy = @x, @y
    case @f
    when :NORTH
      @y += 1
    when :EAST
      @x += 1
    when :SOUTH
      @y -= 1
    when :WEST
      @x -= 1
    end
    
    if @table.is_in(@x, @y) != true then
      @x, @y = oldx, oldy
    end
  end

  def left
    @arc += 90
    if @arc == 360 then
      @arc = 0
    end
    self.face
  end

  def right
    @arc -= 90
    if @arc == -360 then
      @arc = 0
    end
    self.face
  end

  def face
    n = @arc / 90
    if n == 0
      @f = :EAST
    elsif n == 1 or n == -3
      @f = :NORTH
    elsif n == 2 or n == -2
      @f = :WEST
    else
      @f = :SOUTH
    end
  end

  def report
    print "#{@x}, #{@y}, #{@f}"
  end
end


class Table
  def initialize(x, y)
    @x=x
    @y=y
  end

  def is_in(x, y)
    if x < 0 or x > @x
      false
    elsif y < 0 or y > @y
      false
    else
      true
    end
  end
end



#t = Table.new(4, 4)
#r = Robot.new(t)

#r.input([[:place, 0, 0, :NORTH], [:move], [:report]])
#r.input([[:place, 0, 0, :NORTH], [:left], [:report]])
#r.input([[:place, 1, 2, :EAST],[:move], [:move], [:left], [:move], [:report]])
