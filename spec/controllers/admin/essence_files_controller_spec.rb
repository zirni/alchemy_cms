require "spec_helper"

module Alchemy
  describe Admin::EssenceFilesController do

    before do
      sign_in(admin_user)
    end

    let(:content)      { mock_model('Content', essence: essence_file) }
    # let(:essence_file) { mock_model('EssenceFile', :attachment= => nil) }
    let(:essence_file) { FactoryGirl.create(:essence_file) }
    let(:attachment)   { mock_model('Attachment') }

    describe '#edit' do
      before do
        Content.stub(find: content)
      end

      it "should assign @content with the Content found by id" do
        get :edit, content_id: content.id
        expect(assigns(:content)).to eq(content)
      end

      it "should assign @essence_file with content's essence" do
        get :edit, content_id: content.id
        expect(assigns(:essence_file)).to eq(content.essence)
      end
    end

    describe '#update' do
      it "should update the attributes of essence_file" do
        xhr :put, :update, id: essence_file.id, essence_file: { title: "my title", css_class: "no_float" }

        essence_file.reload
        essence_file.title.should     == "my title"
        essence_file.css_class.should == "no_float"
      end
    end

    describe '#assign' do
      before do
        Content.stub(find_by: content)
        Attachment.stub(find_by: attachment)
      end

      it "should assign @attachment with the Attachment found by attachment_id" do
        xhr :put, :assign, content_id: content.id, attachment_id: attachment.id
        expect(assigns(:attachment)).to eq(attachment)
      end

      it "should assign @content.essence.attachment with the attachment found by id" do
        content.essence.should_receive(:attachment=).with(attachment)
        xhr :put, :assign, content_id: content.id, attachment_id: attachment.id
      end

    end

  end
end
