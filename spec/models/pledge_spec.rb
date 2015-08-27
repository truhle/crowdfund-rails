describe "A pledge" do

  it "belongs to a project" do
    project = Project.create(project_attributes)

    pledge = project.pledges.new(pledge_attributes)

    expect(pledge.project).to eq(project)
  end

  it "requires a name" do
    pledge = Pledge.new(name: '')

    pledge.valid?

    expect(pledge.errors[:name].any?).to eq(true)
  end

  it "requires an email" do
    pledge = Pledge.new(email: '')

    pledge.valid?

    expect(pledge.errors[:email].any?).to eq(true)
  end

  it "accepts properly formatted emails" do
    emails = %w[foo@bar.com joe@EXAMPLE.com JOE@example.net joe_schmoe93@somewhere.ca]

    emails.each do |email|
      pledge = Pledge.new(email: email)

      pledge.valid?

      expect(pledge.errors[:email].any?).to eq(false)
    end
  end

  it "rejects improperly formatted emails" do
    emails = %w[foobar.com joe@ @JOEexample.net joe_schmoe.somewhere.ca]

    emails.each do |email|
      pledge = Pledge.new(email: email)

      pledge.valid?

      expect(pledge.errors[:email].any?).to eq(true)
    end
  end

  it "accepts valid amounts" do
    amounts = [25, 50, 100, 200, 500]

    amounts.each do |amount|
      pledge = Pledge.new(amount: amount)

      pledge.valid?

      expect(pledge.errors[:amount].any?).to eq(false)
    end
  end

  it "rejects invalid amounts" do
    amounts = [-10, 12, 0, 5000]

    amounts.each do |amount|
      pledge = Pledge.new(amount: amount)

      pledge.valid?

      expect(pledge.errors[:amount].any?).to eq(true)
    end
  end

end
