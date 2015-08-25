describe "A project" do
  it "has expired if the pledging ends on date is in the past" do
    project = Project.new(pledging_ends_on: 1.days.ago)

    expect(project.expired?).to eq(true)
  end

  it "has not expired if the pledging ends on date is in the future" do
    project = Project.new(pledging_ends_on: 1.days.from_now)

    expect(project.expired?).to eq(false)
  end

  it "requires a name" do
    project = Project.new(name: '')

    project.valid?

    expect(project.errors[:name].any?).to eq(true)
  end

  it "requires a description" do
    project = Project.new(description: '')

    project.valid?

    expect(project.errors[:description].any?).to eq(true)
  end

  it "accepts a description up to 500 characters" do
    description = 'a' * 500
    project = Project.new(description: description)

    project.valid?

    expect(project.errors[:description].any?).to eq(false)
  end

  it 'rejects a description greater than 500 characters' do
    description = 'a' * 501
    project = Project.new(description: description)

    project.valid?

    expect(project.errors[:description].any?).to eq(true)
  end

  it "accepts a positive target pledge amount" do
    project = Project.new(target_pledge_amount: 1)

    project.valid?

    expect(project.errors[:target_pledge_amount].any?).to eq(false)
  end

  it "rejects a $0 target pledge amount" do
    project = Project.new(target_pledge_amount: 0)

    project.valid?

    expect(project.errors[:target_pledge_amount].any?).to eq(true)
  end

  it "rejects a negative target pledge amount" do
    project = Project.new(target_pledge_amount: -1)

    project.valid?

    expect(project.errors[:target_pledge_amount].any?).to eq(true)
  end

  it "accepts properly formatted website URLs" do
    urls = %w[http://foo.com https://bar.net http://this.org http://THIS.ORG]
    urls.each do |url|
      project = Project.new(website: url)
      project.valid?
      expect(project.errors[:website].any?).to eq(false)
    end
  end

  it "rejects improperly formatted website URLs" do
    urls = %w[foo http://.com .org .net project.zzz project.123 htp://example.com https://]
    urls.each do |url|
      project = Project.new(website: url)
      project.valid?
      expect(project.errors[:website].any?).to eq(true)
    end
  end

  it "accepts properly formatted image file names" do
    file_names = %w[e.png project.png project.jpg project.gif PROJECT.GIF]
    file_names.each do |file_name|
      project = Project.new(image_file_name: file_name)
      project.valid?
      expect(project.errors[:image_file_name].any?).to eq(false)
    end
  end

  it "rejects improperly formatted image file names" do
    file_names = %w[project .png .jpg .gif project.pdf project.doc]
    file_names.each do |file_name|
      project = Project.new(image_file_name: file_name)
      project.valid?
      expect(project.errors[:image_file_name].any?).to eq(true)
    end
  end
end
