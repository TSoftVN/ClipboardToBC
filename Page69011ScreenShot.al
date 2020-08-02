page 69011 "Screen Shot"
{
    PageType = Card;
    UsageCategory = Tasks;
    InsertAllowed = true;
    ModifyAllowed = true;
    DeleteAllowed = true;
    Editable = true;
    ApplicationArea = All;
    SourceTable = "Screen Shot";
    layout
    {
        area(Content)
        {
            group("Image Blob")
            {
                field("Screen No."; "Screen No.")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
            }
            group("Screen Shot")
            {
                usercontrol(ScreenShot; "Screen Shot")
                {
                    ApplicationArea = All;
                    Visible = true;
                    trigger PasteScreenShot(PhotoText: Text)
                    var
                        OutStream: OutStream;
                        InStream: InStream;
                        Base64Conv: Codeunit "Base64 Convert";
                        TempBlob: Codeunit "Temp Blob";
                    begin

                        Clear(image);
                        TempBlob.CreateOutStream(OutStream);
                        Base64Conv.FromBase64(PhotoText, OutStream);
                        TempBlob.CreateInStream(InStream);
                        Image.ImportStream(InStream, '');
                        Modify(true);
                    end;
                }
            }
        }
        area(factboxes)
        {
            part(ScreenImage; "Screen Image")
            {
                ApplicationArea = Basic, Suite;
                SubPageLink = "Screen No." = FIELD("Screen No.");
                Visible = true;
            }
        }
    }

    actions
    {
        area(Processing)
        {

        }
    }
    var

    trigger OnOpenPage();
    begin
        if not Get() then
            Insert();
    end;

}
