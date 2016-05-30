<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/SiteChkSheet.Master" CodeBehind="ChkShtDRptAsr5500.aspx.vb" Inherits="ChkShtDRptAsr5500.ChkShtDRptAsr5500" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ChkShtDRptAsr5500" runat="server">
    <script>
        $(function () {
            $("input[type=submit], a, button").button();

            $("#ChkShtDRptAsr5500_txtYear").datepicker({
                dateFormat: 'yy/mm/dd',
                showOn: "button",
                buttonImage: "img/calendar_button.png",
                buttonImageOnly: true
            });

            //$("#accordion").accordion();
            $("#tabs").tabs();
       

            //チェックが入ってるのは背景色追加
            //$(":checked").parent().css("background", "#f3f365");
            //$("input:checked").css("background", "#f3f365");

            var chkboxes = $("input[type=checkbox]");
            chkboxes.filter(':checked').parent().css('background', '#f3f365');


            //var radiobtns = $("input[type=radio]");
            //radiobtns.filter(':checked').parent().css('background-color', '#f3f365');




            /*
            <input type="checkbox"> には background が効かない..Labelに色付け。
            */
            /*
            $.each(chkboxes, function (i,elem) {
                //console.log($(this).is(":checked"));//false


                //if($(this).is(":checked")){
                //    $(this).css("background", "#f3f365");
                //}

                if ($(this).prop('checked')) {
                    alert("チェックされています。");
                    $(this).css("background", "#f3f365");

                }
                else {
                    console.log("チェックされていません。");
                }

               // console.log(elem.checked);

            });
            */
            

            //クリックイベント発火
            $("input").click(function (e) {
                var t = e.target.type;
                var chk = $(this).prop('checked');
                var name = $(this).attr('name');
                //チェックが入ったか入ってないかで条件分岐
                if (t == 'checkbox') {
                    if (chk == true) {
                        $(this).parent().css('background', '#f3f365');
                    } else {
                        $(this).parent().css('background-color', '');
                    }
                }
            });


            $("input[type=radio]").click(function (e) {
               // alert("click");

               // $(this).filter(':checked').parent().css('background', '#f3f365');
                
                var chk = $(this).prop('checked');
                var val = $(this).val()
                $("label[for=ChkShtDRptAsr5500_" + val + "]").css('background', '#f3f365');

            });
            $("input[type=radio]").blur(function (e) {
               // alert("blur");

                //$(this).parent().css('background', '');
                //$(this).css('background-color', '');
                //$(this).closest('label').css('background-color', '');

                

          //      var val = $(this).val()
          //      switch (val) {
          //          case "RBtnInsert":
          //              $("label[name=RBtnInsert]").css('background', 'none');
          //              break;
          //
          //          case "RBtnUpdate":
          //              $("label[name=RBtnUpdate]").css('background', 'none');
          //              break;
          //
          //
          //          case "RBtnDelete":
          //              $("label[name=RBtnDelete]").css('background', 'none');
          //              break;
          //
          //      
          //      }
          //

                //alert(val);
           //     console.log(val);
                var val = $(this).val()
                var chk = $(this).prop('checked');
                //alert(chk);
                $("label[for=ChkShtDRptAsr5500_" + val + "]").css('background', '');
                

                //$("label[for=ChkShtDRptAsr5500_" + val + "]").css('background-color', '');
                
            });


        });
    </script>

    <h2>Daily Report ASR5500 CheckSheet</h2>
        <div>
            <asp:RadioButton ID="RBtnInsert" runat="server" GroupName="Menu" Text="登録" />
             <asp:RadioButton ID="RBtnUpdate" runat="server" GroupName="Menu" Text="修正" />
            <asp:RadioButton ID="RBtnDelete" runat="server" GroupName="Menu" Text="削除" />
        
                

            <%--<label id="lblInst" >
                <asp:RadioButton ID="RBtnInsert" runat="server" GroupName="Menu" />
                登録
            </label>
            <label  id="lblUpd" >
                <asp:RadioButton ID="RBtnUpdate" runat="server" GroupName="Menu" />
                修正
            </label>
            <label   id="lbldel" >
                <asp:RadioButton ID="RBtnDelete" runat="server" GroupName="Menu"  />
                削除
             </label>--%>

             </div>
        <div>
            <asp:TextBox ID="txtYear" runat="server"></asp:TextBox>
            <asp:button runat="server" text="データ検索" ID="btnSearch" />
            <asp:button runat="server" text="メール送信" ID="btnMail" />
        </div>
    
    <!--jQuery UI-->
    <div>
        <asp:Label ID="Label1" runat="server" Text="Label">作成者</asp:Label>
    			  <asp:DropDownList ID="ddListPerson1" runat="server">
                  </asp:DropDownList>
   
        <asp:Label ID="Label2" runat="server" Text="Label">確認者</asp:Label>
        	        <asp:DropDownList ID="ddListPerson2" runat="server">
                  </asp:DropDownList>
    </div>


    <div id="tabs">
         <ul>
            <li><a href="#tabs-1"><asp:Label ID="SheetName01" runat="server" Text="Label">ASR5500_Summary </asp:Label></a></li>
            <li><a href="#tabs-2"><asp:Label ID="SheetName02" runat="server" Text="Label">ASR5500_D </asp:Label></a></li>
            <li><a href="#tabs-3"><asp:Label ID="SheetName03" runat="server" Text="Label">ASR5500_F </asp:Label></a></li>
            <li><a href="#tabs-4"><asp:Label ID="SheetName04" runat="server" Text="Label">ASR5500_H </asp:Label></a></li>
         </ul>
         <div id="tabs-1">
         <table>
		<tr>
			<td>
				<asp:Label ID="Category01" runat="server" Text="Label">XXXXX </asp:Label>
			
			</td>
			<td>
                <asp:Label ID="Content01" runat="server" Text="Label">XXXXXXX </asp:Label>
			</td>
			<td>
			    <asp:CheckBox ID="ChkBoxMaker01" runat="server" />
            </td>
			<td>
			    <asp:CheckBox ID="ChkBoxChecker01" runat="server" />
    		</td>
		</tr>
	
            <tr>
                <td>
			    	<asp:Label ID="Category02" runat="server" Text="Label">XXXXX </asp:Label>
			    
			    </td>
			    <td>
                    <asp:Label ID="Content02" runat="server" Text="Label">XXXXXXXX </asp:Label>
			    </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxMaker02" runat="server" />
                </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxChecker02" runat="server" />
    		    </td>
            </tr>
            <tr>
                <td>
			    	<asp:Label ID="Category03" runat="server" Text="Label">XXXXX </asp:Label>
			    </td>
			    <td>
                    <asp:Label ID="Content03" runat="server" Text="Label">XXXXXXXXX </asp:Label>
			    </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxMaker03" runat="server" />
                </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxChecker03" runat="server" />
    		    </td>
            </tr>
            <tr>
                <td>
			    	<asp:Label ID="Category04" runat="server" Text="Label">XXXXX </asp:Label>
			    </td>
			    <td>
                    <asp:Label ID="Content04" runat="server" Text="Label">XXXXXXXXXX</asp:Label>
			    </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxMaker04" runat="server" />
                </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxChecker04" runat="server" />
    		    </td>
            </tr>
            <tr>
                <td>
			    	<asp:Label ID="Category05" runat="server" Text="Label">XXXXX </asp:Label>
			    </td>
			    <td>
                    <asp:Label ID="Content05" runat="server" Text="Label">XXXXXXXXXXXXXXX </asp:Label>
			    </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxMaker05" runat="server" />
                </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxChecker05" runat="server" />
    		    </td>
            </tr>
            <tr>
                <td>
			    	<asp:Label ID="Category06" runat="server" Text="Label">XXXXX </asp:Label>
			    </td>
			    <td>
                    <asp:Label ID="Content06" runat="server" Text="Label"> XXXXXXXXXXXXXXX</asp:Label>
			    </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxMaker06" runat="server" />
                </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxChecker06" runat="server" />
    		    </td>
            </tr>
            <tr>
                <td>
			    	<asp:Label ID="Category07" runat="server" Text="Label">XXXXX </asp:Label>
			    </td>
			    <td>
                    <asp:Label ID="Content07" runat="server" Text="Label">XXXXXXXXXXXXXXX  </asp:Label>
			    </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxMaker07" runat="server" />
                </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxChecker07" runat="server" />
    		    </td>
            </tr>
            <tr>
                <td>
			    	<asp:Label ID="Category08" runat="server" Text="Label">XXXXX </asp:Label>
			    </td>
			    <td>
                    <asp:Label ID="Content08" runat="server" Text="Label">XXXXXXXXXXXXXXXXX </asp:Label>
			    </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxMaker08" runat="server" />
                </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxChecker08" runat="server" />
    		    </td>
            </tr>
           </table>
         </div>
         <div id="tabs-2">
        <table>
       <tr>
			<td>
				<asp:Label ID="Category09" runat="server" Text="Label">XXXXX </asp:Label>
			
			</td>
			<td>
                <asp:Label ID="Content09" runat="server" Text="Label">XXXXXXX </asp:Label>
			</td>
			<td>
			    <asp:CheckBox ID="ChkBoxMaker09" runat="server" />
            </td>
			<td>
			    <asp:CheckBox ID="ChkBoxChecker09" runat="server" />
    		</td>
		   </tr>

	        <tr>
                <td>
			    	<asp:Label ID="Category10" runat="server" Text="Label">XXXXX </asp:Label>
			    </td>
			    <td>
                    <asp:Label ID="Content10" runat="server" Text="Label">XXXXXXXXXXXXXXXXX </asp:Label>
			    </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxMaker10" runat="server" />
                </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxChecker10" runat="server" />
    		    </td>
            </tr>

             <tr>
                <td>
			    	<asp:Label ID="Category11" runat="server" Text="Label">XXXXX </asp:Label>
			    </td>
			    <td>
                    <asp:Label ID="Content11" runat="server" Text="Label">XXXXXXXXXXXXXXXXX </asp:Label>
			    </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxMaker11" runat="server" />
                </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxChecker11" runat="server" />
    		    </td>
            </tr>
             <tr>
                <td>
			    	<asp:Label ID="Category12" runat="server" Text="Label">XXXXX </asp:Label>
			    </td>
			    <td>
                    <asp:Label ID="Content12" runat="server" Text="Label">XXXXXXXXXXXXXXXXX </asp:Label>
			    </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxMaker12" runat="server" />
                </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxChecker12" runat="server" />
    		    </td>
            </tr>
             <tr>
                <td>
			    	<asp:Label ID="Category13" runat="server" Text="Label">XXXXX </asp:Label>
			    </td>
			    <td>
                    <asp:Label ID="Content13" runat="server" Text="Label">XXXXXXXXXXXXXXXXX </asp:Label>
			    </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxMaker13" runat="server" />
                </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxChecker13" runat="server" />
    		    </td>
            </tr>
            <tr>
                <td>
			    	<asp:Label ID="Category14" runat="server" Text="Label">XXXXX </asp:Label>
			    </td>
			    <td>
                    <asp:Label ID="Content14" runat="server" Text="Label">XXXXXXXXXXXXXXXXX </asp:Label>
			    </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxMaker14" runat="server" />
                </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxChecker14" runat="server" />
    		    </td>
            </tr>
            <tr>
                <td>
			    	<asp:Label ID="Category15" runat="server" Text="Label">XXXXX </asp:Label>
			    </td>
			    <td>
                    <asp:Label ID="Content15" runat="server" Text="Label">XXXXXXXXXXXXXXXXX </asp:Label>
			    </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxMaker15" runat="server" />
                </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxChecker15" runat="server" />
    		    </td>
            </tr>
            <tr>
                <td>
			    	<asp:Label ID="Category16" runat="server" Text="Label">XXXXX </asp:Label>
			    </td>
			    <td>
                    <asp:Label ID="Content16" runat="server" Text="Label">XXXXXXXXXXXXXXXXX </asp:Label>
			    </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxMaker16" runat="server" />
                </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxChecker16" runat="server" />
    		    </td>
            </tr>
            <tr>
                <td>
			    	<asp:Label ID="Category17" runat="server" Text="Label">XXXXX </asp:Label>
			    </td>
			    <td>
                    <asp:Label ID="Content17" runat="server" Text="Label">XXXXXXXXXXXXXXXXX </asp:Label>
			    </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxMaker17" runat="server" />
                </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxChecker17" runat="server" />
    		    </td>
            </tr>
            <tr>
                <td>
			    	<asp:Label ID="Category18" runat="server" Text="Label">XXXXX </asp:Label>
			    </td>
			    <td>
                    <asp:Label ID="Content18" runat="server" Text="Label">XXXXXXXXXXXXXXXXX </asp:Label>
			    </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxMaker18" runat="server" />
                </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxChecker18" runat="server" />
    		    </td>
            </tr>
            <tr>
                <td>
			    	<asp:Label ID="Category19" runat="server" Text="Label">XXXXX </asp:Label>
			    </td>
			    <td>
                    <asp:Label ID="Content19" runat="server" Text="Label">XXXXXXXXXXXXXXXXX </asp:Label>
			    </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxMaker19" runat="server" />
                </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxChecker19" runat="server" />
    		    </td>
            </tr>
            <tr>
                <td>
			    	<asp:Label ID="Category20" runat="server" Text="Label">XXXXX </asp:Label>
			    </td>
			    <td>
                    <asp:Label ID="Content20" runat="server" Text="Label">XXXXXXXXXXXXXXXXX </asp:Label>
			    </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxMaker20" runat="server" />
                </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxChecker20" runat="server" />
    		    </td>
            </tr>
           </table>

         </div>
         <div id="tabs-3">
          <table>
		<tr>
			<td>
				<asp:Label ID="Category21" runat="server" Text="Label">XXXXX </asp:Label>
			
			</td>
			<td>
                <asp:Label ID="Content21" runat="server" Text="Label">XXXXXXX </asp:Label>
			</td>
			<td>
			    <asp:CheckBox ID="ChkBoxMaker21" runat="server" />
            </td>
			<td>
			    <asp:CheckBox ID="ChkBoxChecker21" runat="server" />
    		</td>
		</tr>
         <tr>
                <td>
			    	<asp:Label ID="Category22" runat="server" Text="Label">XXXXX </asp:Label>
			    </td>
			    <td>
                    <asp:Label ID="Content22" runat="server" Text="Label">XXXXXXXXXXXXXXXXX </asp:Label>
			    </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxMaker22" runat="server" />
                </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxChecker22" runat="server" />
    		    </td>
            </tr>
         <tr>
                <td>
			    	<asp:Label ID="Category23" runat="server" Text="Label">XXXXX </asp:Label>
			    </td>
			    <td>
                    <asp:Label ID="Content23" runat="server" Text="Label">XXXXXXXXXXXXXXXXX </asp:Label>
			    </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxMaker23" runat="server" />
                </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxChecker23" runat="server" />
    		    </td>
            </tr>
              <tr>
                <td>
			    	<asp:Label ID="Category24" runat="server" Text="Label">XXXXX </asp:Label>
			    </td>
			    <td>
                    <asp:Label ID="Content24" runat="server" Text="Label">XXXXXXXXXXXXXXXXX </asp:Label>
			    </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxMaker24" runat="server" />
                </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxChecker24" runat="server" />
    		    </td>
            </tr>
             <tr>
                <td>
			    	<asp:Label ID="Category25" runat="server" Text="Label">XXXXX </asp:Label>
			    </td>
			    <td>
                    <asp:Label ID="Content25" runat="server" Text="Label">XXXXXXXXXXXXXXXXX </asp:Label>
			    </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxMaker25" runat="server" />
                </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxChecker25" runat="server" />
    		    </td>
            </tr>
             <tr>
                <td>
			    	<asp:Label ID="Category26" runat="server" Text="Label">XXXXX </asp:Label>
			    </td>
			    <td>
                    <asp:Label ID="Content26" runat="server" Text="Label">XXXXXXXXXXXXXXXXX </asp:Label>
			    </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxMaker26" runat="server" />
                </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxChecker26" runat="server" />
    		    </td>
            </tr>
             <tr>
                <td>
			    	<asp:Label ID="Category27" runat="server" Text="Label">XXXXX </asp:Label>
			    </td>
			    <td>
                    <asp:Label ID="Content27" runat="server" Text="Label">XXXXXXXXXXXXXXXXX </asp:Label>
			    </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxMaker27" runat="server" />
                </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxChecker27" runat="server" />
    		    </td>
            </tr>
            <tr>
                <td>
			    	<asp:Label ID="Category28" runat="server" Text="Label">XXXXX </asp:Label>
			    </td>
			    <td>
                    <asp:Label ID="Content28" runat="server" Text="Label">XXXXXXXXXXXXXXXXX </asp:Label>
			    </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxMaker28" runat="server" />
                </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxChecker28" runat="server" />
    		    </td>
            </tr>
         <tr>
                <td>
			    	<asp:Label ID="Category29" runat="server" Text="Label">XXXXX </asp:Label>
			    </td>
			    <td>
                    <asp:Label ID="Content29" runat="server" Text="Label">XXXXXXXXXXXXXXXXX </asp:Label>
			    </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxMaker29" runat="server" />
                </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxChecker29" runat="server" />
    		    </td>
            </tr>
         <tr>
                <td>
			    	<asp:Label ID="Category30" runat="server" Text="Label">XXXXX </asp:Label>
			    </td>
			    <td>
                    <asp:Label ID="Content30" runat="server" Text="Label">XXXXXXXXXXXXXXXXX </asp:Label>
			    </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxMaker30" runat="server" />
                </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxChecker30" runat="server" />
    		    </td>
        </tr>
        </table>
         </div>
         <div id="tabs-4">
        <table>
		<tr>
			<td>
				<asp:Label ID="Category31" runat="server" Text="Label">XXXXX </asp:Label>
			
			</td>
			<td>
                <asp:Label ID="Content31" runat="server" Text="Label">XXXXXXX </asp:Label>
			</td>
			<td>
			    <asp:CheckBox ID="ChkBoxMaker31" runat="server" />
            </td>
			<td>
			    <asp:CheckBox ID="ChkBoxChecker31" runat="server" />
    		</td>
		</tr>
         <tr>
                <td>
			    	<asp:Label ID="Category32" runat="server" Text="Label">XXXXX </asp:Label>
			    </td>
			    <td>
                    <asp:Label ID="Content32" runat="server" Text="Label">XXXXXXXXXXXXXXXXX </asp:Label>
			    </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxMaker32" runat="server" />
                </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxChecker32" runat="server" />
    		    </td>
        </tr>
         <tr>
                <td>
			    	<asp:Label ID="Category33" runat="server" Text="Label">XXXXX </asp:Label>
			    </td>
			    <td>
                    <asp:Label ID="Content33" runat="server" Text="Label">XXXXXXXXXXXXXXXXX </asp:Label>
			    </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxMaker33" runat="server" />
                </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxChecker33" runat="server" />
    		    </td>
        </tr>
         <tr>
                <td>
			    	<asp:Label ID="Category34" runat="server" Text="Label">XXXXX </asp:Label>
			    </td>
			    <td>
                    <asp:Label ID="Content34" runat="server" Text="Label">XXXXXXXXXXXXXXXXX </asp:Label>
			    </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxMaker34" runat="server" />
                </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxChecker34" runat="server" />
    		    </td>
        </tr>
		</table>
         </div>
    </div>

<%--
    <div id="accordion">
        <h3><asp:Label ID="SheetName01" runat="server" Text="Label">ASR5500_Summary </asp:Label></h3>
        <table>
		<tr>
			<td>
				<asp:Label ID="Category01" runat="server" Text="Label">XXXXX </asp:Label>
			
			</td>
			<td>
                <asp:Label ID="Content01" runat="server" Text="Label">XXXXXXX </asp:Label>
			</td>
			<td>
			    <asp:CheckBox ID="ChkBoxMaker01" runat="server" />
            </td>
			<td>
			    <asp:CheckBox ID="ChkBoxChecker01" runat="server" />
    		</td>
		</tr>
	
            <tr>
                <td>
			    	<asp:Label ID="Category02" runat="server" Text="Label">XXXXX </asp:Label>
			    
			    </td>
			    <td>
                    <asp:Label ID="Content02" runat="server" Text="Label">XXXXXXXX </asp:Label>
			    </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxMaker02" runat="server" />
                </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxChecker02" runat="server" />
    		    </td>
            </tr>
            <tr>
                <td>
			    	<asp:Label ID="Category03" runat="server" Text="Label">XXXXX </asp:Label>
			    </td>
			    <td>
                    <asp:Label ID="Content03" runat="server" Text="Label">XXXXXXXXX </asp:Label>
			    </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxMaker03" runat="server" />
                </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxChecker03" runat="server" />
    		    </td>
            </tr>
            <tr>
                <td>
			    	<asp:Label ID="Category04" runat="server" Text="Label">XXXXX </asp:Label>
			    </td>
			    <td>
                    <asp:Label ID="Content04" runat="server" Text="Label">XXXXXXXXXX</asp:Label>
			    </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxMaker04" runat="server" />
                </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxChecker04" runat="server" />
    		    </td>
            </tr>
            <tr>
                <td>
			    	<asp:Label ID="Category05" runat="server" Text="Label">XXXXX </asp:Label>
			    </td>
			    <td>
                    <asp:Label ID="Content05" runat="server" Text="Label">XXXXXXXXXXXXXXX </asp:Label>
			    </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxMaker05" runat="server" />
                </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxChecker05" runat="server" />
    		    </td>
            </tr>
            <tr>
                <td>
			    	<asp:Label ID="Category06" runat="server" Text="Label">XXXXX </asp:Label>
			    </td>
			    <td>
                    <asp:Label ID="Content06" runat="server" Text="Label"> XXXXXXXXXXXXXXX</asp:Label>
			    </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxMaker06" runat="server" />
                </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxChecker06" runat="server" />
    		    </td>
            </tr>
            <tr>
                <td>
			    	<asp:Label ID="Category07" runat="server" Text="Label">XXXXX </asp:Label>
			    </td>
			    <td>
                    <asp:Label ID="Content07" runat="server" Text="Label">XXXXXXXXXXXXXXX  </asp:Label>
			    </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxMaker07" runat="server" />
                </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxChecker07" runat="server" />
    		    </td>
            </tr>
            <tr>
                <td>
			    	<asp:Label ID="Category08" runat="server" Text="Label">XXXXX </asp:Label>
			    </td>
			    <td>
                    <asp:Label ID="Content08" runat="server" Text="Label">XXXXXXXXXXXXXXXXX </asp:Label>
			    </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxMaker08" runat="server" />
                </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxChecker08" runat="server" />
    		    </td>
            </tr>
           </table>
        
        <h3><asp:Label ID="SheetName02" runat="server" Text="Label">ASR5500_D </asp:Label></h3>
       <table>

			<td>
				<asp:Label ID="Category09" runat="server" Text="Label">XXXXX </asp:Label>
			
			</td>
			<td>
                <asp:Label ID="Content09" runat="server" Text="Label">XXXXXXX </asp:Label>
			</td>
			<td>
			    <asp:CheckBox ID="ChkBoxMaker09" runat="server" />
            </td>
			<td>
			    <asp:CheckBox ID="ChkBoxChecker09" runat="server" />
    		</td>
		   </tr>

	        <tr>
                <td>
			    	<asp:Label ID="Category10" runat="server" Text="Label">XXXXX </asp:Label>
			    </td>
			    <td>
                    <asp:Label ID="Content10" runat="server" Text="Label">XXXXXXXXXXXXXXXXX </asp:Label>
			    </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxMaker10" runat="server" />
                </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxChecker10" runat="server" />
    		    </td>
            </tr>

             <tr>
                <td>
			    	<asp:Label ID="Category11" runat="server" Text="Label">XXXXX </asp:Label>
			    </td>
			    <td>
                    <asp:Label ID="Content11" runat="server" Text="Label">XXXXXXXXXXXXXXXXX </asp:Label>
			    </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxMaker11" runat="server" />
                </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxChecker11" runat="server" />
    		    </td>
            </tr>
             <tr>
                <td>
			    	<asp:Label ID="Category12" runat="server" Text="Label">XXXXX </asp:Label>
			    </td>
			    <td>
                    <asp:Label ID="Content12" runat="server" Text="Label">XXXXXXXXXXXXXXXXX </asp:Label>
			    </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxMaker12" runat="server" />
                </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxChecker12" runat="server" />
    		    </td>
            </tr>
             <tr>
                <td>
			    	<asp:Label ID="Category13" runat="server" Text="Label">XXXXX </asp:Label>
			    </td>
			    <td>
                    <asp:Label ID="Content13" runat="server" Text="Label">XXXXXXXXXXXXXXXXX </asp:Label>
			    </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxMaker13" runat="server" />
                </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxChecker13" runat="server" />
    		    </td>
            </tr>
            <tr>
                <td>
			    	<asp:Label ID="Category14" runat="server" Text="Label">XXXXX </asp:Label>
			    </td>
			    <td>
                    <asp:Label ID="Content14" runat="server" Text="Label">XXXXXXXXXXXXXXXXX </asp:Label>
			    </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxMaker14" runat="server" />
                </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxChecker14" runat="server" />
    		    </td>
            </tr>
            <tr>
                <td>
			    	<asp:Label ID="Category15" runat="server" Text="Label">XXXXX </asp:Label>
			    </td>
			    <td>
                    <asp:Label ID="Content15" runat="server" Text="Label">XXXXXXXXXXXXXXXXX </asp:Label>
			    </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxMaker15" runat="server" />
                </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxChecker15" runat="server" />
    		    </td>
            </tr>
            <tr>
                <td>
			    	<asp:Label ID="Category16" runat="server" Text="Label">XXXXX </asp:Label>
			    </td>
			    <td>
                    <asp:Label ID="Content16" runat="server" Text="Label">XXXXXXXXXXXXXXXXX </asp:Label>
			    </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxMaker16" runat="server" />
                </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxChecker16" runat="server" />
    		    </td>
            </tr>
            <tr>
                <td>
			    	<asp:Label ID="Category17" runat="server" Text="Label">XXXXX </asp:Label>
			    </td>
			    <td>
                    <asp:Label ID="Content17" runat="server" Text="Label">XXXXXXXXXXXXXXXXX </asp:Label>
			    </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxMaker17" runat="server" />
                </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxChecker17" runat="server" />
    		    </td>
            </tr>
            <tr>
                <td>
			    	<asp:Label ID="Category18" runat="server" Text="Label">XXXXX </asp:Label>
			    </td>
			    <td>
                    <asp:Label ID="Content18" runat="server" Text="Label">XXXXXXXXXXXXXXXXX </asp:Label>
			    </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxMaker18" runat="server" />
                </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxChecker18" runat="server" />
    		    </td>
            </tr>
            <tr>
                <td>
			    	<asp:Label ID="Category19" runat="server" Text="Label">XXXXX </asp:Label>
			    </td>
			    <td>
                    <asp:Label ID="Content19" runat="server" Text="Label">XXXXXXXXXXXXXXXXX </asp:Label>
			    </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxMaker19" runat="server" />
                </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxChecker19" runat="server" />
    		    </td>
            </tr>
            <tr>
                <td>
			    	<asp:Label ID="Category20" runat="server" Text="Label">XXXXX </asp:Label>
			    </td>
			    <td>
                    <asp:Label ID="Content20" runat="server" Text="Label">XXXXXXXXXXXXXXXXX </asp:Label>
			    </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxMaker20" runat="server" />
                </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxChecker20" runat="server" />
    		    </td>
            </tr>
           </table>
           <h3><asp:Label ID="SheetName03" runat="server" Text="Label">ASR5500_Summary </asp:Label></h3>
               <table>
		<tr>
			<td>
				<asp:Label ID="Category21" runat="server" Text="Label">XXXXX </asp:Label>
			
			</td>
			<td>
                <asp:Label ID="Content21" runat="server" Text="Label">XXXXXXX </asp:Label>
			</td>
			<td>
			    <asp:CheckBox ID="ChkBoxMaker21" runat="server" />
            </td>
			<td>
			    <asp:CheckBox ID="ChkBoxChecker21" runat="server" />
    		</td>
		</tr>
         <tr>
                <td>
			    	<asp:Label ID="Category22" runat="server" Text="Label">XXXXX </asp:Label>
			    </td>
			    <td>
                    <asp:Label ID="Content22" runat="server" Text="Label">XXXXXXXXXXXXXXXXX </asp:Label>
			    </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxMaker22" runat="server" />
                </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxChecker22" runat="server" />
    		    </td>
            </tr>
         <tr>
                <td>
			    	<asp:Label ID="Category23" runat="server" Text="Label">XXXXX </asp:Label>
			    </td>
			    <td>
                    <asp:Label ID="Content23" runat="server" Text="Label">XXXXXXXXXXXXXXXXX </asp:Label>
			    </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxMaker23" runat="server" />
                </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxChecker23" runat="server" />
    		    </td>
            </tr>
              <tr>
                <td>
			    	<asp:Label ID="Category24" runat="server" Text="Label">XXXXX </asp:Label>
			    </td>
			    <td>
                    <asp:Label ID="Content24" runat="server" Text="Label">XXXXXXXXXXXXXXXXX </asp:Label>
			    </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxMaker24" runat="server" />
                </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxChecker24" runat="server" />
    		    </td>
            </tr>
             <tr>
                <td>
			    	<asp:Label ID="Category25" runat="server" Text="Label">XXXXX </asp:Label>
			    </td>
			    <td>
                    <asp:Label ID="Content25" runat="server" Text="Label">XXXXXXXXXXXXXXXXX </asp:Label>
			    </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxMaker25" runat="server" />
                </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxChecker25" runat="server" />
    		    </td>
            </tr>
             <tr>
                <td>
			    	<asp:Label ID="Category26" runat="server" Text="Label">XXXXX </asp:Label>
			    </td>
			    <td>
                    <asp:Label ID="Content26" runat="server" Text="Label">XXXXXXXXXXXXXXXXX </asp:Label>
			    </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxMaker26" runat="server" />
                </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxChecker26" runat="server" />
    		    </td>
            </tr>
             <tr>
                <td>
			    	<asp:Label ID="Category27" runat="server" Text="Label">XXXXX </asp:Label>
			    </td>
			    <td>
                    <asp:Label ID="Content27" runat="server" Text="Label">XXXXXXXXXXXXXXXXX </asp:Label>
			    </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxMaker27" runat="server" />
                </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxChecker27" runat="server" />
    		    </td>
            </tr>
            <tr>
                <td>
			    	<asp:Label ID="Category28" runat="server" Text="Label">XXXXX </asp:Label>
			    </td>
			    <td>
                    <asp:Label ID="Content28" runat="server" Text="Label">XXXXXXXXXXXXXXXXX </asp:Label>
			    </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxMaker28" runat="server" />
                </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxChecker28" runat="server" />
    		    </td>
            </tr>
         <tr>
                <td>
			    	<asp:Label ID="Category29" runat="server" Text="Label">XXXXX </asp:Label>
			    </td>
			    <td>
                    <asp:Label ID="Content29" runat="server" Text="Label">XXXXXXXXXXXXXXXXX </asp:Label>
			    </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxMaker29" runat="server" />
                </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxChecker29" runat="server" />
    		    </td>
            </tr>
         <tr>
                <td>
			    	<asp:Label ID="Category30" runat="server" Text="Label">XXXXX </asp:Label>
			    </td>
			    <td>
                    <asp:Label ID="Content30" runat="server" Text="Label">XXXXXXXXXXXXXXXXX </asp:Label>
			    </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxMaker30" runat="server" />
                </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxChecker30" runat="server" />
    		    </td>
        </tr>
        </table>
                <h3><asp:Label ID="SheetName04" runat="server" Text="Label">ASR5500_H </asp:Label></h3>
        <table>
		<tr>
			<td>
				<asp:Label ID="Category31" runat="server" Text="Label">XXXXX </asp:Label>
			
			</td>
			<td>
                <asp:Label ID="Content31" runat="server" Text="Label">XXXXXXX </asp:Label>
			</td>
			<td>
			    <asp:CheckBox ID="ChkBoxMaker31" runat="server" />
            </td>
			<td>
			    <asp:CheckBox ID="ChkBoxChecker31" runat="server" />
    		</td>
		</tr>
         <tr>
                <td>
			    	<asp:Label ID="Category32" runat="server" Text="Label">XXXXX </asp:Label>
			    </td>
			    <td>
                    <asp:Label ID="Content32" runat="server" Text="Label">XXXXXXXXXXXXXXXXX </asp:Label>
			    </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxMaker32" runat="server" />
                </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxChecker32" runat="server" />
    		    </td>
        </tr>
         <tr>
                <td>
			    	<asp:Label ID="Category33" runat="server" Text="Label">XXXXX </asp:Label>
			    </td>
			    <td>
                    <asp:Label ID="Content33" runat="server" Text="Label">XXXXXXXXXXXXXXXXX </asp:Label>
			    </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxMaker33" runat="server" />
                </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxChecker33" runat="server" />
    		    </td>
        </tr>
         <tr>
                <td>
			    	<asp:Label ID="Category34" runat="server" Text="Label">XXXXX </asp:Label>
			    </td>
			    <td>
                    <asp:Label ID="Content34" runat="server" Text="Label">XXXXXXXXXXXXXXXXX </asp:Label>
			    </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxMaker34" runat="server" />
                </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxChecker34" runat="server" />
    		    </td>
        </tr>
		</table>
    </div>
--%>


<%--    <table>
		<tr>
			<th>
				シート
			</th>
			
			<th>
				項目
			</th>
			<th>
				確認内容
			</th>
			<th>
				  <asp:DropDownList ID="ddListPerson1" runat="server">
                      <asp:ListItem>五十嵐</asp:ListItem>
                  </asp:DropDownList>
	
			</th>
          <th>
				  <asp:DropDownList ID="ddListPerson2" runat="server">
                      <asp:ListItem>五十嵐</asp:ListItem>
                  </asp:DropDownList>
			</th>
		</tr>
		<tr>
			<td rowspan="8" >
				<asp:Label ID="SheetName01" runat="server" Text="Label">ASR5500_Summary </asp:Label>
			</td>
			<td>
				<asp:Label ID="Category01" runat="server" Text="Label">XXXXX </asp:Label>
			
			</td>
			<td>
                <asp:Label ID="Content01" runat="server" Text="Label">XXXXXXX </asp:Label>
			</td>
			<td>
			    <asp:CheckBox ID="ChkBoxMaker01" runat="server" />
            </td>
			<td>
			    <asp:CheckBox ID="ChkBoxChecker01" runat="server" />
    		</td>
		</tr>
	
            <tr>
                <td>
			    	<asp:Label ID="Category02" runat="server" Text="Label">XXXXX </asp:Label>
			    
			    </td>
			    <td>
                    <asp:Label ID="Content02" runat="server" Text="Label">XXXXXXXX </asp:Label>
			    </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxMaker02" runat="server" />
                </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxChecker02" runat="server" />
    		    </td>
            </tr>
            <tr>
                <td>
			    	<asp:Label ID="Category03" runat="server" Text="Label">XXXXX </asp:Label>
			    </td>
			    <td>
                    <asp:Label ID="Content03" runat="server" Text="Label">XXXXXXXXX </asp:Label>
			    </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxMaker03" runat="server" />
                </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxChecker03" runat="server" />
    		    </td>
            </tr>
            <tr>
                <td>
			    	<asp:Label ID="Category04" runat="server" Text="Label">XXXXX </asp:Label>
			    </td>
			    <td>
                    <asp:Label ID="Content04" runat="server" Text="Label">XXXXXXXXXX</asp:Label>
			    </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxMaker04" runat="server" />
                </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxChecker04" runat="server" />
    		    </td>
            </tr>
            <tr>
                <td>
			    	<asp:Label ID="Category05" runat="server" Text="Label">XXXXX </asp:Label>
			    </td>
			    <td>
                    <asp:Label ID="Content05" runat="server" Text="Label">XXXXXXXXXXXXXXX </asp:Label>
			    </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxMaker05" runat="server" />
                </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxChecker05" runat="server" />
    		    </td>
            </tr>
            <tr>
                <td>
			    	<asp:Label ID="Category06" runat="server" Text="Label">XXXXX </asp:Label>
			    </td>
			    <td>
                    <asp:Label ID="Content06" runat="server" Text="Label"> XXXXXXXXXXXXXXX</asp:Label>
			    </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxMaker06" runat="server" />
                </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxChecker06" runat="server" />
    		    </td>
            </tr>
            <tr>
                <td>
			    	<asp:Label ID="Category07" runat="server" Text="Label">XXXXX </asp:Label>
			    </td>
			    <td>
                    <asp:Label ID="Content07" runat="server" Text="Label">XXXXXXXXXXXXXXX  </asp:Label>
			    </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxMaker07" runat="server" />
                </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxChecker07" runat="server" />
    		    </td>
            </tr>
            <tr>
                <td>
			    	<asp:Label ID="Category08" runat="server" Text="Label">XXXXX </asp:Label>
			    </td>
			    <td>
                    <asp:Label ID="Content08" runat="server" Text="Label">XXXXXXXXXXXXXXXXX </asp:Label>
			    </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxMaker08" runat="server" />
                </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxChecker08" runat="server" />
    		    </td>
            </tr>
           <tr>
			<td rowspan="12" >
				<asp:Label ID="SheetName02" runat="server" Text="Label">ASR5500_D </asp:Label>
			</td>
			<td>
				<asp:Label ID="Category09" runat="server" Text="Label">XXXXX </asp:Label>
			
			</td>
			<td>
                <asp:Label ID="Content09" runat="server" Text="Label">XXXXXXX </asp:Label>
			</td>
			<td>
			    <asp:CheckBox ID="ChkBoxMaker09" runat="server" />
            </td>
			<td>
			    <asp:CheckBox ID="ChkBoxChecker09" runat="server" />
    		</td>
		</tr>

	        <tr>
                <td>
			    	<asp:Label ID="Category10" runat="server" Text="Label">XXXXX </asp:Label>
			    </td>
			    <td>
                    <asp:Label ID="Content10" runat="server" Text="Label">XXXXXXXXXXXXXXXXX </asp:Label>
			    </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxMaker10" runat="server" />
                </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxChecker10" runat="server" />
    		    </td>
            </tr>

             <tr>
                <td>
			    	<asp:Label ID="Category11" runat="server" Text="Label">XXXXX </asp:Label>
			    </td>
			    <td>
                    <asp:Label ID="Content11" runat="server" Text="Label">XXXXXXXXXXXXXXXXX </asp:Label>
			    </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxMaker11" runat="server" />
                </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxChecker11" runat="server" />
    		    </td>
            </tr>
             <tr>
                <td>
			    	<asp:Label ID="Category12" runat="server" Text="Label">XXXXX </asp:Label>
			    </td>
			    <td>
                    <asp:Label ID="Content12" runat="server" Text="Label">XXXXXXXXXXXXXXXXX </asp:Label>
			    </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxMaker12" runat="server" />
                </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxChecker12" runat="server" />
    		    </td>
            </tr>
             <tr>
                <td>
			    	<asp:Label ID="Category13" runat="server" Text="Label">XXXXX </asp:Label>
			    </td>
			    <td>
                    <asp:Label ID="Content13" runat="server" Text="Label">XXXXXXXXXXXXXXXXX </asp:Label>
			    </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxMaker13" runat="server" />
                </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxChecker13" runat="server" />
    		    </td>
            </tr>
            <tr>
                <td>
			    	<asp:Label ID="Category14" runat="server" Text="Label">XXXXX </asp:Label>
			    </td>
			    <td>
                    <asp:Label ID="Content14" runat="server" Text="Label">XXXXXXXXXXXXXXXXX </asp:Label>
			    </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxMaker14" runat="server" />
                </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxChecker14" runat="server" />
    		    </td>
            </tr>
            <tr>
                <td>
			    	<asp:Label ID="Category15" runat="server" Text="Label">XXXXX </asp:Label>
			    </td>
			    <td>
                    <asp:Label ID="Content15" runat="server" Text="Label">XXXXXXXXXXXXXXXXX </asp:Label>
			    </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxMaker15" runat="server" />
                </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxChecker15" runat="server" />
    		    </td>
            </tr>
            <tr>
                <td>
			    	<asp:Label ID="Category16" runat="server" Text="Label">XXXXX </asp:Label>
			    </td>
			    <td>
                    <asp:Label ID="Content16" runat="server" Text="Label">XXXXXXXXXXXXXXXXX </asp:Label>
			    </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxMaker16" runat="server" />
                </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxChecker16" runat="server" />
    		    </td>
            </tr>
            <tr>
                <td>
			    	<asp:Label ID="Category17" runat="server" Text="Label">XXXXX </asp:Label>
			    </td>
			    <td>
                    <asp:Label ID="Content17" runat="server" Text="Label">XXXXXXXXXXXXXXXXX </asp:Label>
			    </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxMaker17" runat="server" />
                </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxChecker17" runat="server" />
    		    </td>
            </tr>
            <tr>
                <td>
			    	<asp:Label ID="Category18" runat="server" Text="Label">XXXXX </asp:Label>
			    </td>
			    <td>
                    <asp:Label ID="Content18" runat="server" Text="Label">XXXXXXXXXXXXXXXXX </asp:Label>
			    </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxMaker18" runat="server" />
                </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxChecker18" runat="server" />
    		    </td>
            </tr>
            <tr>
                <td>
			    	<asp:Label ID="Category19" runat="server" Text="Label">XXXXX </asp:Label>
			    </td>
			    <td>
                    <asp:Label ID="Content19" runat="server" Text="Label">XXXXXXXXXXXXXXXXX </asp:Label>
			    </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxMaker19" runat="server" />
                </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxChecker19" runat="server" />
    		    </td>
            </tr>
            <tr>
                <td>
			    	<asp:Label ID="Category20" runat="server" Text="Label">XXXXX </asp:Label>
			    </td>
			    <td>
                    <asp:Label ID="Content20" runat="server" Text="Label">XXXXXXXXXXXXXXXXX </asp:Label>
			    </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxMaker20" runat="server" />
                </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxChecker20" runat="server" />
    		    </td>
            </tr>
		<tr>
			<td rowspan="10" >
				<asp:Label ID="SheetName03" runat="server" Text="Label">ASR5500_Summary </asp:Label>
			</td>
			<td>
				<asp:Label ID="Category21" runat="server" Text="Label">XXXXX </asp:Label>
			
			</td>
			<td>
                <asp:Label ID="Content21" runat="server" Text="Label">XXXXXXX </asp:Label>
			</td>
			<td>
			    <asp:CheckBox ID="ChkBoxMaker21" runat="server" />
            </td>
			<td>
			    <asp:CheckBox ID="ChkBoxChecker21" runat="server" />
    		</td>
		</tr>
         <tr>
                <td>
			    	<asp:Label ID="Category22" runat="server" Text="Label">XXXXX </asp:Label>
			    </td>
			    <td>
                    <asp:Label ID="Content22" runat="server" Text="Label">XXXXXXXXXXXXXXXXX </asp:Label>
			    </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxMaker22" runat="server" />
                </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxChecker22" runat="server" />
    		    </td>
            </tr>
         <tr>
                <td>
			    	<asp:Label ID="Category23" runat="server" Text="Label">XXXXX </asp:Label>
			    </td>
			    <td>
                    <asp:Label ID="Content23" runat="server" Text="Label">XXXXXXXXXXXXXXXXX </asp:Label>
			    </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxMaker23" runat="server" />
                </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxChecker23" runat="server" />
    		    </td>
            </tr>
              <tr>
                <td>
			    	<asp:Label ID="Category24" runat="server" Text="Label">XXXXX </asp:Label>
			    </td>
			    <td>
                    <asp:Label ID="Content24" runat="server" Text="Label">XXXXXXXXXXXXXXXXX </asp:Label>
			    </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxMaker24" runat="server" />
                </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxChecker24" runat="server" />
    		    </td>
            </tr>
             <tr>
                <td>
			    	<asp:Label ID="Category25" runat="server" Text="Label">XXXXX </asp:Label>
			    </td>
			    <td>
                    <asp:Label ID="Content25" runat="server" Text="Label">XXXXXXXXXXXXXXXXX </asp:Label>
			    </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxMaker25" runat="server" />
                </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxChecker25" runat="server" />
    		    </td>
            </tr>
             <tr>
                <td>
			    	<asp:Label ID="Category26" runat="server" Text="Label">XXXXX </asp:Label>
			    </td>
			    <td>
                    <asp:Label ID="Content26" runat="server" Text="Label">XXXXXXXXXXXXXXXXX </asp:Label>
			    </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxMaker26" runat="server" />
                </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxChecker26" runat="server" />
    		    </td>
            </tr>
             <tr>
                <td>
			    	<asp:Label ID="Category27" runat="server" Text="Label">XXXXX </asp:Label>
			    </td>
			    <td>
                    <asp:Label ID="Content27" runat="server" Text="Label">XXXXXXXXXXXXXXXXX </asp:Label>
			    </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxMaker27" runat="server" />
                </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxChecker27" runat="server" />
    		    </td>
            </tr>
            <tr>
                <td>
			    	<asp:Label ID="Category28" runat="server" Text="Label">XXXXX </asp:Label>
			    </td>
			    <td>
                    <asp:Label ID="Content28" runat="server" Text="Label">XXXXXXXXXXXXXXXXX </asp:Label>
			    </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxMaker28" runat="server" />
                </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxChecker28" runat="server" />
    		    </td>
            </tr>
         <tr>
                <td>
			    	<asp:Label ID="Category29" runat="server" Text="Label">XXXXX </asp:Label>
			    </td>
			    <td>
                    <asp:Label ID="Content29" runat="server" Text="Label">XXXXXXXXXXXXXXXXX </asp:Label>
			    </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxMaker29" runat="server" />
                </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxChecker29" runat="server" />
    		    </td>
            </tr>
         <tr>
                <td>
			    	<asp:Label ID="Category30" runat="server" Text="Label">XXXXX </asp:Label>
			    </td>
			    <td>
                    <asp:Label ID="Content30" runat="server" Text="Label">XXXXXXXXXXXXXXXXX </asp:Label>
			    </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxMaker30" runat="server" />
                </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxChecker30" runat="server" />
    		    </td>
        </tr>
		<tr>
			<td rowspan="4" >
				<asp:Label ID="SheetName04" runat="server" Text="Label">ASR5500_H </asp:Label>
			</td>
			<td>
				<asp:Label ID="Category31" runat="server" Text="Label">XXXXX </asp:Label>
			
			</td>
			<td>
                <asp:Label ID="Content31" runat="server" Text="Label">XXXXXXX </asp:Label>
			</td>
			<td>
			    <asp:CheckBox ID="ChkBoxMaker31" runat="server" />
            </td>
			<td>
			    <asp:CheckBox ID="ChkBoxChecker31" runat="server" />
    		</td>
		</tr>
         <tr>
                <td>
			    	<asp:Label ID="Category32" runat="server" Text="Label">XXXXX </asp:Label>
			    </td>
			    <td>
                    <asp:Label ID="Content32" runat="server" Text="Label">XXXXXXXXXXXXXXXXX </asp:Label>
			    </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxMaker32" runat="server" />
                </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxChecker32" runat="server" />
    		    </td>
        </tr>
         <tr>
                <td>
			    	<asp:Label ID="Category33" runat="server" Text="Label">XXXXX </asp:Label>
			    </td>
			    <td>
                    <asp:Label ID="Content33" runat="server" Text="Label">XXXXXXXXXXXXXXXXX </asp:Label>
			    </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxMaker33" runat="server" />
                </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxChecker33" runat="server" />
    		    </td>
        </tr>
         <tr>
                <td>
			    	<asp:Label ID="Category34" runat="server" Text="Label">XXXXX </asp:Label>
			    </td>
			    <td>
                    <asp:Label ID="Content34" runat="server" Text="Label">XXXXXXXXXXXXXXXXX </asp:Label>
			    </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxMaker34" runat="server" />
                </td>
			    <td>
			        <asp:CheckBox ID="ChkBoxChecker34" runat="server" />
    		    </td>
        </tr>
		</table>--%>





        <div>
         <asp:Button ID="btnSubmit" runat="server" Text="サーバーに送信" />    
           <asp:Label ID="lblMsg" runat="server" Text="メッセージが表示されます" ForeColor="#FF3300"></asp:Label>
        </div>   
</asp:Content>



