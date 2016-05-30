<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/SiteChkSheet.Master" CodeBehind="MailForm.aspx.vb" Inherits="ChkShtDRptAsr5500.MailForm" EnableEventValidation="False" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ChkShtDRptAsr5500" runat="server">
    <script>
        $(function () {
            $("input[type=submit], a, button").button();


            $("input[type=radio]").click(function (e) {
                var chk = $(this).prop('checked');
                var val = $(this).val()
                $("label[for=ChkShtDRptAsr5500_" + val + "]").css('background', '#f3f365');

            });
            $("input[type=radio]").blur(function (e) {
                var chk = $(this).prop('checked');
                var val = $(this).val()
                $("label[for=ChkShtDRptAsr5500_" + val + "]").css('background-color', '');
            });
        });
    </script>


    <div>
       
            <asp:RadioButton ID="MenuRequest" runat="server" GroupName="Menu" Text="ダブルチェック依頼メール" />
            <asp:RadioButton ID="MenuPass" runat="server" GroupName="Menu" Text="ダブルチェックパスメール" />
            <asp:RadioButton ID="MenuNotPass" runat="server" GroupName="Menu" Text="やり直しお願いメール" />
           
    </div>

    <div>
        <asp:Label ID="lblTo" runat="server" Text="To:"></asp:Label>
        <asp:DropDownList ID="ddListPersonTo" runat="server" >
        </asp:DropDownList>
        

   
       <asp:Label ID="lblFrom" runat="server" Text="FROM："></asp:Label>
       <asp:DropDownList ID="ddListPersonFrom" runat="server">
       </asp:DropDownList>

       <asp:Label ID="lblMsg" runat="server" Text="メッセージが表示されます" ForeColor="Red"></asp:Label>
        

    </div>
    <div>
        <asp:Label ID="Label1" runat="server" Text="コメント"></asp:Label>
        
    </div>
    <div>
        <asp:TextBox ID="txtMailBody" runat="server" Rows="100" Width="500px" Height="500px" TextMode="MultiLine" ToolTip="コメント"></asp:TextBox>

    </div>
    
    <div>
   
       
        <asp:Button ID="btnSubmitMail" runat="server" Text="メール送信" />
         <asp:Button ID="btnToMainSys" runat="server" Text="戻る" />
    </div>
</asp:Content>
