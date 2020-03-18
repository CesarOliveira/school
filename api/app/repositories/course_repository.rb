module CourseRepository
  extend self

  def find_all
    Course.all
  end

  def find_by_id(id)
    Course.find(id)
  end

  def find_by_name(name)
    Course.where('lower(name) LIKE ?', "%#{name.downcase}%").all
  end

  def create(data)
    Course.new(data)
  end

  def save(course)
    course.save
  end

  def update(course, data)
    course.update(data)
  end

  def destroy(course)
    course.destroy
  end
end
