page 69012 "Screen Image"
{
    Caption = 'Screen Picture';
    DeleteAllowed = false;
    InsertAllowed = false;
    LinksAllowed = false;
    PageType = CardPart;
    SourceTable = "Screen Shot";

    layout
    {
        area(content)
        {
            field(Image; Image)
            {
                ApplicationArea = All;
                ShowCaption = false;
            }
        }
    }

    actions
    {
        area(processing)
        {
        }
    }
}