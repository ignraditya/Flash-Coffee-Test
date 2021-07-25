def get_center_axis(coordinate):
    index1 = coordinate.index('[')+1
    index2 = coordinate.index(',')
    x = int(coordinate[index1:index2])

    index1 = coordinate.index(']')+2
    index2 = coordinate.index(',', coordinate.index(',') + 1)
    y = int(coordinate[index1:index2])

    center_x = (x + y)/2
    return center_x

def get_center_ordinate(coordinate):
    index1 = coordinate.index(',')+1
    index2 = coordinate.index(']')
    x = int(coordinate[index1:index2])

    index1 = coordinate.index(',', coordinate.index(',') + 1) + 1
    y = int(coordinate[index1:-1])

    center_y = (x + y)/2
    return center_y

def get_top_bound(coordinate):
    index1 = coordinate.index(',')+1
    index2 = coordinate.index(']')
    return int(coordinate[index1:index2])
