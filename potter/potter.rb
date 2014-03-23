class Potter

  def cost(books)
    total = 0
    difference(books)
    if @ret.length != 0
      total += 8
    end
    return total
  end

  def difference(books)
    @unique_books = books.uniq
    @ret = books.dup
    @unique_books.each do |element|
      if index = @ret.index(element)
        @ret.delete_at(index)
      end
    end
    return @ret
  end

  #do, while loops
  #unique discount sets

end