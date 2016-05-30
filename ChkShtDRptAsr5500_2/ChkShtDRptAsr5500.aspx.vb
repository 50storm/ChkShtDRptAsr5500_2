Imports System
Imports System.Configuration
Imports System.Data
Imports System.Linq
Imports System.Data.SqlClient
Imports System.Data.Linq
Imports System.Transactions



Public Class ChkShtDRptAsr5500
    Inherits System.Web.UI.Page
    Private strConn As String = ConfigurationManager.ConnectionStrings("ConnectionString").ToString()
    Private strPdiConn As String = ConfigurationManager.ConnectionStrings("pdiConnectionString").ToString()


    Private Function IsRegisterd(keyDate As String) As Boolean
        Dim Dc As New Asr5500ChkSheetDataContext(strConn)
        Dim Query = (From x In Dc.asr5500_chksheets
                     Where x.date = CDate(keyDate)
                     Order By x.id Descending).ToArray()

        If Query.Length = 0 Then

            Return False
        Else
            Return True
        End If


    End Function


    Private Sub DeleteData()
        Try

            Using ASR5500ChkSheet As New Asr5500ChkSheetDataContext(strConn)
                ASR5500ChkSheet.ExecuteCommand("DELETE FROM asr5500_chksheets WHERE date = {0}", Me.txtYear.Text.Replace("/", "-"))

            End Using
            Me.lblMsg.Text = "チェックシートを削除しました"

        Catch ex As Exception
            Me.lblMsg.Text = "例外発生"
        End Try


    End Sub


    Private Function MakeUpdSql() As String
        Dim updSql As String = String.Empty
        Dim updSqlNo As String = String.Empty
        Dim updSqlNoDbl As String = String.Empty
        Dim updSqlName As String = String.Empty
        Dim updSqWhere As String = String.Empty
        Const CellNo As Integer = 34

        updSql = "UPDATE asr5500_chksheets SET  "

        For i As Integer = 1 To CellNo
            If (i < 40) Then
                updSqlNo &= " no" & i.ToString() & " = " & "@no" & i.ToString() & ","
            Else
                updSqlNo &= " no" & i.ToString() & " = " & "@no" & i.ToString()
            End If

        Next


        For i As Integer = 1 To CellNo
            updSqlNoDbl &= " no" & i.ToString() & "_dblchk = " & "@no" & i.ToString() & "_dblchk,"
        Next

        updSqlName = " name1 = @name1 , name2 = @name2"

        updSqWhere = " WHERE date = @date"


        Return updSql & updSqlNo & updSqlNoDbl & updSqlName & updSqWhere

    End Function


    'Private Sub SetUpdSql(SqlCmd As SqlCommand, chkbox As CheckBox)
    '    For i As Integer = 1 To 40
    '        SqlCmd.Parameters.Add("@no" & i.ToString(), SqlDbType.Bit).Value = chkbox.Checked

    '    Next i

    'End Sub

    Private Sub UndateData()

        'Dim updSql As String = "UPDATE asr5500_chksheets SET  " &
        '                       "   no1 = @no1 ,  no2 = @no2 , no3 = @no3, no4 = @no4, no5 = @no5, no6 = @no6, no7 = @no7 " &
        '                       "  ,no1_dblchk = @no1_dblchk ,  no2_dblchk = @no2_dblchk , no3_dblchk = @no3_dblchk, no4_dblchk = @no4_dblchk, no5_dblchk = @no5_dblchk, no6_dblchk = @no6_dblchk, no7_dblchk = @no7_dblchk " &
        '                       "  ,name1 = @name1 , name2 = @name2" &
        '                       " WHERE date = @date"

        Dim updSql As String = MakeUpdSql()


        Using con As New SqlConnection(strConn)


            Dim trans As SqlTransaction
            con.Open()
            trans = con.BeginTransaction()

            Try


                Dim SqlCmd As New SqlCommand(updSql, con)

                '作成者
                SqlCmd.Parameters.Add("@no1", SqlDbType.Bit).Value = Me.ChkBoxMaker01.Checked
                SqlCmd.Parameters.Add("@no2", SqlDbType.Bit).Value = Me.ChkBoxMaker02.Checked
                SqlCmd.Parameters.Add("@no3", SqlDbType.Bit).Value = Me.ChkBoxMaker03.Checked
                SqlCmd.Parameters.Add("@no4", SqlDbType.Bit).Value = Me.ChkBoxMaker04.Checked
                SqlCmd.Parameters.Add("@no5", SqlDbType.Bit).Value = Me.ChkBoxMaker05.Checked
                SqlCmd.Parameters.Add("@no6", SqlDbType.Bit).Value = Me.ChkBoxMaker06.Checked
                SqlCmd.Parameters.Add("@no7", SqlDbType.Bit).Value = Me.ChkBoxMaker07.Checked
                SqlCmd.Parameters.Add("@no8", SqlDbType.Bit).Value = Me.ChkBoxMaker08.Checked
                SqlCmd.Parameters.Add("@no9", SqlDbType.Bit).Value = Me.ChkBoxMaker09.Checked
                SqlCmd.Parameters.Add("@no10", SqlDbType.Bit).Value = Me.ChkBoxMaker10.Checked
                SqlCmd.Parameters.Add("@no11", SqlDbType.Bit).Value = Me.ChkBoxMaker11.Checked
                SqlCmd.Parameters.Add("@no12", SqlDbType.Bit).Value = Me.ChkBoxMaker12.Checked
                SqlCmd.Parameters.Add("@no13", SqlDbType.Bit).Value = Me.ChkBoxMaker13.Checked
                SqlCmd.Parameters.Add("@no14", SqlDbType.Bit).Value = Me.ChkBoxMaker14.Checked
                SqlCmd.Parameters.Add("@no15", SqlDbType.Bit).Value = Me.ChkBoxMaker15.Checked
                SqlCmd.Parameters.Add("@no16", SqlDbType.Bit).Value = Me.ChkBoxMaker16.Checked
                SqlCmd.Parameters.Add("@no17", SqlDbType.Bit).Value = Me.ChkBoxMaker17.Checked
                SqlCmd.Parameters.Add("@no18", SqlDbType.Bit).Value = Me.ChkBoxMaker18.Checked
                SqlCmd.Parameters.Add("@no19", SqlDbType.Bit).Value = Me.ChkBoxMaker19.Checked
                SqlCmd.Parameters.Add("@no20", SqlDbType.Bit).Value = Me.ChkBoxMaker20.Checked
                SqlCmd.Parameters.Add("@no21", SqlDbType.Bit).Value = Me.ChkBoxMaker21.Checked
                SqlCmd.Parameters.Add("@no22", SqlDbType.Bit).Value = Me.ChkBoxMaker22.Checked
                SqlCmd.Parameters.Add("@no23", SqlDbType.Bit).Value = Me.ChkBoxMaker23.Checked
                SqlCmd.Parameters.Add("@no24", SqlDbType.Bit).Value = Me.ChkBoxMaker24.Checked
                SqlCmd.Parameters.Add("@no25", SqlDbType.Bit).Value = Me.ChkBoxMaker25.Checked
                SqlCmd.Parameters.Add("@no26", SqlDbType.Bit).Value = Me.ChkBoxMaker26.Checked
                SqlCmd.Parameters.Add("@no27", SqlDbType.Bit).Value = Me.ChkBoxMaker27.Checked
                SqlCmd.Parameters.Add("@no28", SqlDbType.Bit).Value = Me.ChkBoxMaker28.Checked
                SqlCmd.Parameters.Add("@no29", SqlDbType.Bit).Value = Me.ChkBoxMaker29.Checked
                SqlCmd.Parameters.Add("@no30", SqlDbType.Bit).Value = Me.ChkBoxMaker30.Checked
                SqlCmd.Parameters.Add("@no31", SqlDbType.Bit).Value = Me.ChkBoxMaker31.Checked
                SqlCmd.Parameters.Add("@no32", SqlDbType.Bit).Value = Me.ChkBoxMaker32.Checked
                SqlCmd.Parameters.Add("@no33", SqlDbType.Bit).Value = Me.ChkBoxMaker33.Checked
                SqlCmd.Parameters.Add("@no34", SqlDbType.Bit).Value = Me.ChkBoxMaker34.Checked



                '確認者
                SqlCmd.Parameters.Add("@no1_dblchk", SqlDbType.Bit).Value = Me.ChkBoxChecker01.Checked
                SqlCmd.Parameters.Add("@no2_dblchk", SqlDbType.Bit).Value = Me.ChkBoxChecker02.Checked
                SqlCmd.Parameters.Add("@no3_dblchk", SqlDbType.Bit).Value = Me.ChkBoxChecker03.Checked
                SqlCmd.Parameters.Add("@no4_dblchk", SqlDbType.Bit).Value = Me.ChkBoxChecker04.Checked
                SqlCmd.Parameters.Add("@no5_dblchk", SqlDbType.Bit).Value = Me.ChkBoxChecker05.Checked
                SqlCmd.Parameters.Add("@no6_dblchk", SqlDbType.Bit).Value = Me.ChkBoxChecker06.Checked
                SqlCmd.Parameters.Add("@no7_dblchk", SqlDbType.Bit).Value = Me.ChkBoxChecker07.Checked
                SqlCmd.Parameters.Add("@no8_dblchk", SqlDbType.Bit).Value = Me.ChkBoxChecker08.Checked
                SqlCmd.Parameters.Add("@no9_dblchk", SqlDbType.Bit).Value = Me.ChkBoxChecker09.Checked
                SqlCmd.Parameters.Add("@no10_dblchk", SqlDbType.Bit).Value = Me.ChkBoxChecker10.Checked
                SqlCmd.Parameters.Add("@no11_dblchk", SqlDbType.Bit).Value = Me.ChkBoxChecker11.Checked
                SqlCmd.Parameters.Add("@no12_dblchk", SqlDbType.Bit).Value = Me.ChkBoxChecker12.Checked
                SqlCmd.Parameters.Add("@no13_dblchk", SqlDbType.Bit).Value = Me.ChkBoxChecker13.Checked
                SqlCmd.Parameters.Add("@no14_dblchk", SqlDbType.Bit).Value = Me.ChkBoxChecker14.Checked
                SqlCmd.Parameters.Add("@no15_dblchk", SqlDbType.Bit).Value = Me.ChkBoxChecker15.Checked
                SqlCmd.Parameters.Add("@no16_dblchk", SqlDbType.Bit).Value = Me.ChkBoxChecker16.Checked
                SqlCmd.Parameters.Add("@no17_dblchk", SqlDbType.Bit).Value = Me.ChkBoxChecker17.Checked
                SqlCmd.Parameters.Add("@no18_dblchk", SqlDbType.Bit).Value = Me.ChkBoxChecker18.Checked
                SqlCmd.Parameters.Add("@no19_dblchk", SqlDbType.Bit).Value = Me.ChkBoxChecker19.Checked
                SqlCmd.Parameters.Add("@no20_dblchk", SqlDbType.Bit).Value = Me.ChkBoxChecker20.Checked
                SqlCmd.Parameters.Add("@no21_dblchk", SqlDbType.Bit).Value = Me.ChkBoxChecker21.Checked
                SqlCmd.Parameters.Add("@no22_dblchk", SqlDbType.Bit).Value = Me.ChkBoxChecker22.Checked
                SqlCmd.Parameters.Add("@no23_dblchk", SqlDbType.Bit).Value = Me.ChkBoxChecker23.Checked
                SqlCmd.Parameters.Add("@no24_dblchk", SqlDbType.Bit).Value = Me.ChkBoxChecker24.Checked
                SqlCmd.Parameters.Add("@no25_dblchk", SqlDbType.Bit).Value = Me.ChkBoxChecker25.Checked
                SqlCmd.Parameters.Add("@no26_dblchk", SqlDbType.Bit).Value = Me.ChkBoxChecker26.Checked
                SqlCmd.Parameters.Add("@no27_dblchk", SqlDbType.Bit).Value = Me.ChkBoxChecker27.Checked
                SqlCmd.Parameters.Add("@no28_dblchk", SqlDbType.Bit).Value = Me.ChkBoxChecker28.Checked
                SqlCmd.Parameters.Add("@no29_dblchk", SqlDbType.Bit).Value = Me.ChkBoxChecker29.Checked
                SqlCmd.Parameters.Add("@no30_dblchk", SqlDbType.Bit).Value = Me.ChkBoxChecker30.Checked
                SqlCmd.Parameters.Add("@no31_dblchk", SqlDbType.Bit).Value = Me.ChkBoxChecker31.Checked
                SqlCmd.Parameters.Add("@no32_dblchk", SqlDbType.Bit).Value = Me.ChkBoxChecker32.Checked
                SqlCmd.Parameters.Add("@no33_dblchk", SqlDbType.Bit).Value = Me.ChkBoxChecker33.Checked
                SqlCmd.Parameters.Add("@no34_dblchk", SqlDbType.Bit).Value = Me.ChkBoxChecker34.Checked


                SqlCmd.Parameters.Add("@name1", SqlDbType.VarChar).Value = Me.ddListPerson1.Text
                SqlCmd.Parameters.Add("@name2", SqlDbType.VarChar).Value = Me.ddListPerson2.Text

                SqlCmd.Parameters.Add("@date", SqlDbType.Date).Value = Me.txtYear.Text.Trim



                SqlCmd.Transaction = trans
                SqlCmd.ExecuteNonQuery()
                trans.Commit()

                Me.lblMsg.Text = "チェックシートを修正しました"

            Catch ex As Exception

                trans.Rollback()

                Me.lblMsg.Text = "例外が発生しました"

            End Try


        End Using



    End Sub





    Private Sub InsertData()
        Using con As New SqlConnection(strConn)

            Using ObjContext As New DataContext(con)
                Dim Asr5500ChkSheet = ObjContext.GetTable(Of asr5500_chksheets)()
                Dim EntityAsr5500 As New asr5500_chksheets


                Using Tran = New TransactionScope()

                    Try
                        EntityAsr5500.date = CDate(Me.txtYear.Text)

                        '作った人
                        If Me.ChkBoxMaker01.Checked Then
                            EntityAsr5500.no1 = True
                        Else
                            EntityAsr5500.no1 = False
                        End If

                        If Me.ChkBoxMaker02.Checked Then
                            EntityAsr5500.no2 = True
                        Else
                            EntityAsr5500.no2 = False
                        End If

                        If Me.ChkBoxMaker03.Checked Then
                            EntityAsr5500.no3 = True
                        Else
                            EntityAsr5500.no3 = False
                        End If

                        If Me.ChkBoxMaker04.Checked Then
                            EntityAsr5500.no4 = True
                        Else
                            EntityAsr5500.no4 = False
                        End If

                        If Me.ChkBoxMaker05.Checked Then
                            EntityAsr5500.no5 = True
                        Else
                            EntityAsr5500.no5 = False
                        End If

                        If Me.ChkBoxMaker06.Checked Then
                            EntityAsr5500.no6 = True
                        Else
                            EntityAsr5500.no6 = False
                        End If

                        If Me.ChkBoxMaker07.Checked Then
                            EntityAsr5500.no7 = True
                        Else
                            EntityAsr5500.no7 = False
                        End If

                        If Me.ChkBoxMaker08.Checked Then
                            EntityAsr5500.no8 = True
                        Else
                            EntityAsr5500.no8 = False
                        End If

                        If Me.ChkBoxMaker09.Checked Then
                            EntityAsr5500.no9 = True
                        Else
                            EntityAsr5500.no9 = False
                        End If

                        If Me.ChkBoxMaker10.Checked Then
                            EntityAsr5500.no10 = True
                        Else
                            EntityAsr5500.no10 = False
                        End If

                        If Me.ChkBoxMaker11.Checked Then
                            EntityAsr5500.no11 = True
                        Else
                            EntityAsr5500.no11 = False
                        End If

                        If Me.ChkBoxMaker12.Checked Then
                            EntityAsr5500.no12 = True
                        Else
                            EntityAsr5500.no12 = False
                        End If

                        If Me.ChkBoxMaker13.Checked Then
                            EntityAsr5500.no13 = True
                        Else
                            EntityAsr5500.no13 = False
                        End If

                        If Me.ChkBoxMaker14.Checked Then
                            EntityAsr5500.no14 = True
                        Else
                            EntityAsr5500.no14 = False
                        End If

                        If Me.ChkBoxMaker15.Checked Then
                            EntityAsr5500.no15 = True
                        Else
                            EntityAsr5500.no15 = False
                        End If

                        If Me.ChkBoxMaker16.Checked Then
                            EntityAsr5500.no16 = True
                        Else
                            EntityAsr5500.no16 = False
                        End If

                        If Me.ChkBoxMaker17.Checked Then
                            EntityAsr5500.no17 = True
                        Else
                            EntityAsr5500.no17 = False
                        End If

                        If Me.ChkBoxMaker18.Checked Then
                            EntityAsr5500.no18 = True
                        Else
                            EntityAsr5500.no18 = False
                        End If

                        If Me.ChkBoxMaker19.Checked Then
                            EntityAsr5500.no19 = True
                        Else
                            EntityAsr5500.no19 = False
                        End If

                        If Me.ChkBoxMaker20.Checked Then
                            EntityAsr5500.no20 = True
                        Else
                            EntityAsr5500.no20 = False
                        End If

                        If Me.ChkBoxMaker21.Checked Then
                            EntityAsr5500.no21 = True
                        Else
                            EntityAsr5500.no21 = False
                        End If

                        If Me.ChkBoxMaker22.Checked Then
                            EntityAsr5500.no22 = True
                        Else
                            EntityAsr5500.no22 = False
                        End If

                        If Me.ChkBoxMaker23.Checked Then
                            EntityAsr5500.no23 = True
                        Else
                            EntityAsr5500.no23 = False
                        End If

                        If Me.ChkBoxMaker24.Checked Then
                            EntityAsr5500.no24 = True
                        Else
                            EntityAsr5500.no24 = False
                        End If

                        If Me.ChkBoxMaker25.Checked Then
                            EntityAsr5500.no25 = True
                        Else
                            EntityAsr5500.no25 = False
                        End If

                        If Me.ChkBoxMaker26.Checked Then
                            EntityAsr5500.no26 = True
                        Else
                            EntityAsr5500.no26 = False
                        End If

                        If Me.ChkBoxMaker27.Checked Then
                            EntityAsr5500.no27 = True
                        Else
                            EntityAsr5500.no27 = False
                        End If

                        If Me.ChkBoxMaker28.Checked Then
                            EntityAsr5500.no28 = True
                        Else
                            EntityAsr5500.no28 = False
                        End If

                        If Me.ChkBoxMaker29.Checked Then
                            EntityAsr5500.no29 = True
                        Else
                            EntityAsr5500.no29 = False
                        End If

                        If Me.ChkBoxMaker30.Checked Then
                            EntityAsr5500.no30 = True
                        Else
                            EntityAsr5500.no30 = False
                        End If

                        If Me.ChkBoxMaker31.Checked Then
                            EntityAsr5500.no31 = True
                        Else
                            EntityAsr5500.no31 = False
                        End If

                        If Me.ChkBoxMaker32.Checked Then
                            EntityAsr5500.no32 = True
                        Else
                            EntityAsr5500.no32 = False
                        End If

                        If Me.ChkBoxMaker33.Checked Then
                            EntityAsr5500.no33 = True
                        Else
                            EntityAsr5500.no33 = False
                        End If

                        If Me.ChkBoxMaker34.Checked Then
                            EntityAsr5500.no34 = True
                        Else
                            EntityAsr5500.no34 = False
                        End If

                        'ダブルチェック
                        If Me.ChkBoxChecker01.Checked Then
                            EntityAsr5500.no1_dblchk = True
                        Else
                            EntityAsr5500.no1_dblchk = False
                        End If

                        If Me.ChkBoxChecker02.Checked Then
                            EntityAsr5500.no2_dblchk = True
                        Else
                            EntityAsr5500.no2_dblchk = False
                        End If

                        If Me.ChkBoxChecker03.Checked Then
                            EntityAsr5500.no3_dblchk = True
                        Else
                            EntityAsr5500.no3_dblchk = False
                        End If

                        If Me.ChkBoxChecker04.Checked Then
                            EntityAsr5500.no4_dblchk = True
                        Else
                            EntityAsr5500.no4_dblchk = False
                        End If

                        If Me.ChkBoxChecker05.Checked Then
                            EntityAsr5500.no5_dblchk = True
                        Else
                            EntityAsr5500.no5_dblchk = False
                        End If

                        If Me.ChkBoxChecker06.Checked Then
                            EntityAsr5500.no6_dblchk = True
                        Else
                            EntityAsr5500.no6_dblchk = False
                        End If

                        If Me.ChkBoxChecker07.Checked Then
                            EntityAsr5500.no7_dblchk = True
                        Else
                            EntityAsr5500.no7_dblchk = False
                        End If

                        If Me.ChkBoxChecker08.Checked Then
                            EntityAsr5500.no8_dblchk = True
                        Else
                            EntityAsr5500.no8_dblchk = False
                        End If

                        If Me.ChkBoxChecker09.Checked Then
                            EntityAsr5500.no9_dblchk = True
                        Else
                            EntityAsr5500.no9_dblchk = False
                        End If

                        If Me.ChkBoxChecker10.Checked Then
                            EntityAsr5500.no10_dblchk = True
                        Else
                            EntityAsr5500.no10_dblchk = False
                        End If

                        If Me.ChkBoxChecker11.Checked Then
                            EntityAsr5500.no11_dblchk = True
                        Else
                            EntityAsr5500.no11_dblchk = False
                        End If

                        If Me.ChkBoxChecker12.Checked Then
                            EntityAsr5500.no12_dblchk = True
                        Else
                            EntityAsr5500.no12_dblchk = False
                        End If

                        If Me.ChkBoxChecker13.Checked Then
                            EntityAsr5500.no13_dblchk = True
                        Else
                            EntityAsr5500.no13_dblchk = False
                        End If

                        If Me.ChkBoxChecker14.Checked Then
                            EntityAsr5500.no14_dblchk = True
                        Else
                            EntityAsr5500.no14_dblchk = False
                        End If

                        If Me.ChkBoxChecker15.Checked Then
                            EntityAsr5500.no15_dblchk = True
                        Else
                            EntityAsr5500.no15_dblchk = False
                        End If

                        If Me.ChkBoxChecker16.Checked Then
                            EntityAsr5500.no16_dblchk = True
                        Else
                            EntityAsr5500.no16_dblchk = False
                        End If

                        If Me.ChkBoxChecker17.Checked Then
                            EntityAsr5500.no17_dblchk = True
                        Else
                            EntityAsr5500.no17_dblchk = False
                        End If

                        If Me.ChkBoxChecker18.Checked Then
                            EntityAsr5500.no18_dblchk = True
                        Else
                            EntityAsr5500.no18_dblchk = False
                        End If

                        If Me.ChkBoxChecker19.Checked Then
                            EntityAsr5500.no19_dblchk = True
                        Else
                            EntityAsr5500.no19_dblchk = False
                        End If

                        If Me.ChkBoxChecker20.Checked Then
                            EntityAsr5500.no20_dblchk = True
                        Else
                            EntityAsr5500.no20_dblchk = False
                        End If

                        If Me.ChkBoxChecker21.Checked Then
                            EntityAsr5500.no21_dblchk = True
                        Else
                            EntityAsr5500.no21_dblchk = False
                        End If

                        If Me.ChkBoxChecker22.Checked Then
                            EntityAsr5500.no22_dblchk = True
                        Else
                            EntityAsr5500.no22_dblchk = False
                        End If

                        If Me.ChkBoxChecker23.Checked Then
                            EntityAsr5500.no23_dblchk = True
                        Else
                            EntityAsr5500.no23_dblchk = False
                        End If

                        If Me.ChkBoxChecker24.Checked Then
                            EntityAsr5500.no24_dblchk = True
                        Else
                            EntityAsr5500.no24_dblchk = False
                        End If

                        If Me.ChkBoxChecker25.Checked Then
                            EntityAsr5500.no25_dblchk = True
                        Else
                            EntityAsr5500.no25_dblchk = False
                        End If

                        If Me.ChkBoxChecker26.Checked Then
                            EntityAsr5500.no26_dblchk = True
                        Else
                            EntityAsr5500.no26_dblchk = False
                        End If

                        If Me.ChkBoxChecker27.Checked Then
                            EntityAsr5500.no27_dblchk = True
                        Else
                            EntityAsr5500.no27_dblchk = False
                        End If

                        If Me.ChkBoxChecker28.Checked Then
                            EntityAsr5500.no28_dblchk = True
                        Else
                            EntityAsr5500.no28_dblchk = False
                        End If

                        If Me.ChkBoxChecker29.Checked Then
                            EntityAsr5500.no29_dblchk = True
                        Else
                            EntityAsr5500.no29_dblchk = False
                        End If

                        If Me.ChkBoxChecker30.Checked Then
                            EntityAsr5500.no30_dblchk = True
                        Else
                            EntityAsr5500.no30_dblchk = False
                        End If

                        If Me.ChkBoxChecker31.Checked Then
                            EntityAsr5500.no31_dblchk = True
                        Else
                            EntityAsr5500.no31_dblchk = False
                        End If

                        If Me.ChkBoxChecker32.Checked Then
                            EntityAsr5500.no32_dblchk = True
                        Else
                            EntityAsr5500.no32_dblchk = False
                        End If

                        If Me.ChkBoxChecker33.Checked Then
                            EntityAsr5500.no33_dblchk = True
                        Else
                            EntityAsr5500.no33_dblchk = False
                        End If

                        If Me.ChkBoxChecker34.Checked Then
                            EntityAsr5500.no34_dblchk = True
                        Else
                            EntityAsr5500.no34_dblchk = False
                        End If


                        EntityAsr5500.name1 = Me.ddListPerson1.Text
                        EntityAsr5500.name2 = Me.ddListPerson2.Text


                        Asr5500ChkSheet.InsertOnSubmit(EntityAsr5500)
                        ObjContext.SubmitChanges()
                        Tran.Complete()

                    Catch ex As TransactionAbortedException
                        Me.lblMsg.Text = "トランザクション失敗[INSERT]：" & ex.Message
                        Throw

                    Catch ex As Exception
                        Me.lblMsg.Text = "例外発生：" & ex.Message
                        Throw


                    End Try
                End Using
            End Using
        End Using
    End Sub


    'TODO
    Private Sub setChkBox(ByRef Query() As asr5500_chksheets)

        '作った人
        If Query(0).no1 Is Nothing OrElse Query(0).no1 = False Then
            Me.ChkBoxMaker01.Checked = False

        Else
            Me.ChkBoxMaker01.Checked = True

        End If

        If Query(0).no2 Is Nothing OrElse Query(0).no2 = False Then
            Me.ChkBoxMaker02.Checked = False

        Else
            Me.ChkBoxMaker02.Checked = True

        End If

        If Query(0).no3 Is Nothing OrElse Query(0).no3 = False Then
            Me.ChkBoxMaker03.Checked = False

        Else
            Me.ChkBoxMaker03.Checked = True

        End If


        If Query(0).no4 Is Nothing OrElse Query(0).no4 = False Then
            Me.ChkBoxMaker04.Checked = False

        Else
            Me.ChkBoxMaker04.Checked = True

        End If


        If Query(0).no5 Is Nothing OrElse Query(0).no5 = False Then
            Me.ChkBoxMaker05.Checked = False

        Else
            Me.ChkBoxMaker05.Checked = True

        End If


        If Query(0).no6 Is Nothing OrElse Query(0).no6 = False Then
            Me.ChkBoxMaker06.Checked = False

        Else
            Me.ChkBoxMaker06.Checked = True

        End If


        If Query(0).no7 Is Nothing OrElse Query(0).no7 = False Then
            Me.ChkBoxMaker07.Checked = False

        Else
            Me.ChkBoxMaker07.Checked = True

        End If


        If Query(0).no8 Is Nothing OrElse Query(0).no8 = False Then
            Me.ChkBoxMaker08.Checked = False

        Else
            Me.ChkBoxMaker08.Checked = True

        End If

        If Query(0).no9 Is Nothing OrElse Query(0).no9 = False Then
            Me.ChkBoxMaker09.Checked = False

        Else
            Me.ChkBoxMaker09.Checked = True

        End If

        If Query(0).no10 Is Nothing OrElse Query(0).no10 = False Then
            Me.ChkBoxMaker10.Checked = False

        Else
            Me.ChkBoxMaker10.Checked = True

        End If

        If Query(0).no11 Is Nothing OrElse Query(0).no11 = False Then
            Me.ChkBoxMaker11.Checked = False

        Else
            Me.ChkBoxMaker11.Checked = True

        End If

        If Query(0).no12 Is Nothing OrElse Query(0).no12 = False Then
            Me.ChkBoxMaker12.Checked = False

        Else
            Me.ChkBoxMaker12.Checked = True

        End If

        If Query(0).no13 Is Nothing OrElse Query(0).no13 = False Then
            Me.ChkBoxMaker13.Checked = False

        Else
            Me.ChkBoxMaker13.Checked = True

        End If

        If Query(0).no14 Is Nothing OrElse Query(0).no14 = False Then
            Me.ChkBoxMaker14.Checked = False

        Else
            Me.ChkBoxMaker14.Checked = True

        End If

        If Query(0).no15 Is Nothing OrElse Query(0).no15 = False Then
            Me.ChkBoxMaker15.Checked = False

        Else
            Me.ChkBoxMaker15.Checked = True

        End If

        If Query(0).no16 Is Nothing OrElse Query(0).no16 = False Then
            Me.ChkBoxMaker16.Checked = False

        Else
            Me.ChkBoxMaker16.Checked = True

        End If

        If Query(0).no17 Is Nothing OrElse Query(0).no17 = False Then
            Me.ChkBoxMaker17.Checked = False

        Else
            Me.ChkBoxMaker17.Checked = True

        End If

        If Query(0).no18 Is Nothing OrElse Query(0).no18 = False Then
            Me.ChkBoxMaker18.Checked = False

        Else
            Me.ChkBoxMaker18.Checked = True

        End If

        If Query(0).no19 Is Nothing OrElse Query(0).no19 = False Then
            Me.ChkBoxMaker19.Checked = False

        Else
            Me.ChkBoxMaker19.Checked = True

        End If

        If Query(0).no20 Is Nothing OrElse Query(0).no20 = False Then
            Me.ChkBoxMaker20.Checked = False

        Else
            Me.ChkBoxMaker20.Checked = True

        End If

        If Query(0).no21 Is Nothing OrElse Query(0).no21 = False Then
            Me.ChkBoxMaker21.Checked = False

        Else
            Me.ChkBoxMaker21.Checked = True

        End If

        If Query(0).no22 Is Nothing OrElse Query(0).no22 = False Then
            Me.ChkBoxMaker22.Checked = False

        Else
            Me.ChkBoxMaker22.Checked = True

        End If

        If Query(0).no23 Is Nothing OrElse Query(0).no23 = False Then
            Me.ChkBoxMaker23.Checked = False

        Else
            Me.ChkBoxMaker23.Checked = True

        End If

        If Query(0).no24 Is Nothing OrElse Query(0).no24 = False Then
            Me.ChkBoxMaker24.Checked = False

        Else
            Me.ChkBoxMaker24.Checked = True

        End If

        If Query(0).no25 Is Nothing OrElse Query(0).no25 = False Then
            Me.ChkBoxMaker25.Checked = False

        Else
            Me.ChkBoxMaker25.Checked = True

        End If
        If Query(0).no26 Is Nothing OrElse Query(0).no26 = False Then
            Me.ChkBoxMaker26.Checked = False

        Else
            Me.ChkBoxMaker26.Checked = True

        End If
        If Query(0).no27 Is Nothing OrElse Query(0).no27 = False Then
            Me.ChkBoxMaker27.Checked = False

        Else
            Me.ChkBoxMaker27.Checked = True

        End If
        If Query(0).no28 Is Nothing OrElse Query(0).no28 = False Then
            Me.ChkBoxMaker28.Checked = False

        Else
            Me.ChkBoxMaker28.Checked = True

        End If
        If Query(0).no29 Is Nothing OrElse Query(0).no29 = False Then
            Me.ChkBoxMaker29.Checked = False

        Else
            Me.ChkBoxMaker29.Checked = True

        End If
        If Query(0).no30 Is Nothing OrElse Query(0).no30 = False Then
            Me.ChkBoxMaker30.Checked = False

        Else
            Me.ChkBoxMaker30.Checked = True

        End If
        If Query(0).no31 Is Nothing OrElse Query(0).no31 = False Then
            Me.ChkBoxMaker31.Checked = False

        Else
            Me.ChkBoxMaker31.Checked = True

        End If
        If Query(0).no32 Is Nothing OrElse Query(0).no32 = False Then
            Me.ChkBoxMaker32.Checked = False

        Else
            Me.ChkBoxMaker32.Checked = True

        End If

        If Query(0).no33 Is Nothing OrElse Query(0).no33 = False Then
            Me.ChkBoxMaker33.Checked = False

        Else
            Me.ChkBoxMaker33.Checked = True

        End If
        If Query(0).no34 Is Nothing OrElse Query(0).no34 = False Then
            Me.ChkBoxMaker34.Checked = False

        Else
            Me.ChkBoxMaker34.Checked = True

        End If

        'ダブルチェック
        If Query(0).no1_dblchk Is Nothing OrElse Query(0).no1 = False Then
            Me.ChkBoxChecker01.Checked = False

        Else
            Me.ChkBoxChecker01.Checked = True

        End If

        If Query(0).no2_dblchk Is Nothing OrElse Query(0).no2_dblchk = False Then
            Me.ChkBoxChecker02.Checked = False

        Else
            Me.ChkBoxChecker02.Checked = True

        End If

        If Query(0).no3_dblchk Is Nothing OrElse Query(0).no3_dblchk = False Then
            Me.ChkBoxChecker03.Checked = False

        Else
            Me.ChkBoxChecker03.Checked = True

        End If


        If Query(0).no4_dblchk Is Nothing OrElse Query(0).no4_dblchk = False Then
            Me.ChkBoxChecker04.Checked = False

        Else
            Me.ChkBoxChecker04.Checked = True

        End If


        If Query(0).no5_dblchk Is Nothing OrElse Query(0).no5_dblchk = False Then
            Me.ChkBoxChecker05.Checked = False

        Else
            Me.ChkBoxChecker05.Checked = True

        End If


        If Query(0).no6_dblchk Is Nothing OrElse Query(0).no6_dblchk = False Then
            Me.ChkBoxChecker06.Checked = False

        Else
            Me.ChkBoxChecker06.Checked = True

        End If


        If Query(0).no7_dblchk Is Nothing OrElse Query(0).no7_dblchk = False Then
            Me.ChkBoxChecker07.Checked = False

        Else
            Me.ChkBoxChecker07.Checked = True

        End If


        If Query(0).no8_dblchk Is Nothing OrElse Query(0).no8_dblchk = False Then
            Me.ChkBoxChecker08.Checked = False

        Else
            Me.ChkBoxChecker08.Checked = True

        End If

        If Query(0).no9_dblchk Is Nothing OrElse Query(0).no9_dblchk = False Then
            Me.ChkBoxChecker09.Checked = False

        Else
            Me.ChkBoxChecker09.Checked = True

        End If

        If Query(0).no10_dblchk Is Nothing OrElse Query(0).no10_dblchk = False Then
            Me.ChkBoxChecker10.Checked = False

        Else
            Me.ChkBoxChecker10.Checked = True

        End If

        If Query(0).no11_dblchk Is Nothing OrElse Query(0).no11_dblchk = False Then
            Me.ChkBoxChecker11.Checked = False

        Else
            Me.ChkBoxChecker11.Checked = True

        End If

        If Query(0).no12_dblchk Is Nothing OrElse Query(0).no12_dblchk = False Then
            Me.ChkBoxChecker12.Checked = False

        Else
            Me.ChkBoxChecker12.Checked = True

        End If

        If Query(0).no13_dblchk Is Nothing OrElse Query(0).no13_dblchk = False Then
            Me.ChkBoxChecker13.Checked = False

        Else
            Me.ChkBoxChecker13.Checked = True

        End If

        If Query(0).no14_dblchk Is Nothing OrElse Query(0).no14_dblchk = False Then
            Me.ChkBoxChecker14.Checked = False

        Else
            Me.ChkBoxChecker14.Checked = True

        End If

        If Query(0).no15_dblchk Is Nothing OrElse Query(0).no15_dblchk = False Then
            Me.ChkBoxChecker15.Checked = False

        Else
            Me.ChkBoxChecker15.Checked = True

        End If

        If Query(0).no16_dblchk Is Nothing OrElse Query(0).no16_dblchk = False Then
            Me.ChkBoxChecker16.Checked = False

        Else
            Me.ChkBoxChecker16.Checked = True

        End If

        If Query(0).no17_dblchk Is Nothing OrElse Query(0).no17_dblchk = False Then
            Me.ChkBoxChecker17.Checked = False

        Else
            Me.ChkBoxChecker17.Checked = True

        End If

        If Query(0).no18_dblchk Is Nothing OrElse Query(0).no18_dblchk = False Then
            Me.ChkBoxChecker18.Checked = False

        Else
            Me.ChkBoxChecker18.Checked = True

        End If

        If Query(0).no19_dblchk Is Nothing OrElse Query(0).no19_dblchk = False Then
            Me.ChkBoxChecker19.Checked = False

        Else
            Me.ChkBoxChecker19.Checked = True

        End If

        If Query(0).no20_dblchk Is Nothing OrElse Query(0).no20_dblchk = False Then
            Me.ChkBoxChecker20.Checked = False

        Else
            Me.ChkBoxChecker20.Checked = True

        End If

        If Query(0).no21_dblchk Is Nothing OrElse Query(0).no21_dblchk = False Then
            Me.ChkBoxChecker21.Checked = False

        Else
            Me.ChkBoxChecker21.Checked = True

        End If

        If Query(0).no22_dblchk Is Nothing OrElse Query(0).no22_dblchk = False Then
            Me.ChkBoxChecker22.Checked = False

        Else
            Me.ChkBoxChecker22.Checked = True

        End If

        If Query(0).no23_dblchk Is Nothing OrElse Query(0).no23_dblchk = False Then
            Me.ChkBoxChecker23.Checked = False

        Else
            Me.ChkBoxChecker23.Checked = True

        End If

        If Query(0).no24_dblchk Is Nothing OrElse Query(0).no24_dblchk = False Then
            Me.ChkBoxChecker24.Checked = False

        Else
            Me.ChkBoxChecker24.Checked = True

        End If

        If Query(0).no25_dblchk Is Nothing OrElse Query(0).no25_dblchk = False Then
            Me.ChkBoxChecker25.Checked = False

        Else
            Me.ChkBoxChecker25.Checked = True

        End If
        If Query(0).no26_dblchk Is Nothing OrElse Query(0).no26_dblchk = False Then
            Me.ChkBoxChecker26.Checked = False

        Else
            Me.ChkBoxChecker26.Checked = True

        End If
        If Query(0).no27_dblchk Is Nothing OrElse Query(0).no27_dblchk = False Then
            Me.ChkBoxChecker27.Checked = False

        Else
            Me.ChkBoxChecker27.Checked = True

        End If
        If Query(0).no28_dblchk Is Nothing OrElse Query(0).no28_dblchk = False Then
            Me.ChkBoxChecker28.Checked = False

        Else
            Me.ChkBoxChecker28.Checked = True

        End If
        If Query(0).no29_dblchk Is Nothing OrElse Query(0).no29_dblchk = False Then
            Me.ChkBoxChecker29.Checked = False

        Else
            Me.ChkBoxChecker29.Checked = True

        End If
        If Query(0).no30_dblchk Is Nothing OrElse Query(0).no30_dblchk = False Then
            Me.ChkBoxChecker30.Checked = False

        Else
            Me.ChkBoxChecker30.Checked = True

        End If
        If Query(0).no31_dblchk Is Nothing OrElse Query(0).no31_dblchk = False Then
            Me.ChkBoxChecker31.Checked = False

        Else
            Me.ChkBoxChecker31.Checked = True

        End If
        If Query(0).no32_dblchk Is Nothing OrElse Query(0).no32_dblchk = False Then
            Me.ChkBoxChecker32.Checked = False

        Else
            Me.ChkBoxChecker32.Checked = True

        End If

        If Query(0).no33_dblchk Is Nothing OrElse Query(0).no33_dblchk = False Then
            Me.ChkBoxChecker33.Checked = False

        Else
            Me.ChkBoxChecker33.Checked = True

        End If
        If Query(0).no34_dblchk Is Nothing OrElse Query(0).no34_dblchk = False Then
            Me.ChkBoxChecker34.Checked = False

        Else
            Me.ChkBoxChecker34.Checked = True

        End If

    End Sub


    Private Sub setView()
        Dim CellsSetting As XElement = XElement.Load(My.Settings("CellsSettings").ToString().Trim())

        Dim qContentCells = (From x In CellsSetting.<Content>
                             Select x.<cell1>.Value, x.<cell2>.Value, x.<cell3>.Value, x.<cell4>.Value,
                                 x.<cell5>.Value, x.<cell6>.Value, x.<cell7>.Value, x.<cell8>.Value,
                                 x.<cell9>.Value, x.<cell10>.Value, x.<cell11>.Value, x.<cell12>.Value,
                                 x.<cell13>.Value, x.<cell14>.Value, x.<cell15>.Value, x.<cell16>.Value,
                                 x.<cell17>.Value, x.<cell18>.Value, x.<cell19>.Value, x.<cell20>.Value,
                                 x.<cell21>.Value, x.<cell22>.Value, x.<cell23>.Value, x.<cell24>.Value,
                                 x.<cell25>.Value, x.<cell26>.Value, x.<cell27>.Value, x.<cell28>.Value,
                                 x.<cell29>.Value, x.<cell30>.Value, x.<cell31>.Value, x.<cell32>.Value,
                                 x.<cell33>.Value, x.<cell34>.Value).ToArray()

        'Content
        Me.Content01.Text = qContentCells(0).cell1.Trim()
        Me.Content02.Text = qContentCells(0).cell2.Trim()
        Me.Content03.Text = qContentCells(0).cell3.Trim()
        Me.Content04.Text = qContentCells(0).cell4.Trim()
        Me.Content05.Text = qContentCells(0).cell5.Trim()
        Me.Content06.Text = qContentCells(0).cell6.Trim()
        Me.Content07.Text = qContentCells(0).cell7.Trim()
        Me.Content08.Text = qContentCells(0).cell8.Trim()
        Me.Content09.Text = qContentCells(0).cell9.Trim()
        Me.Content10.Text = qContentCells(0).cell10.Trim()
        Me.Content11.Text = qContentCells(0).cell11.Trim()
        Me.Content12.Text = qContentCells(0).cell12.Trim()
        Me.Content13.Text = qContentCells(0).cell13.Trim()
        Me.Content14.Text = qContentCells(0).cell14.Trim()
        Me.Content15.Text = qContentCells(0).cell15.Trim()
        Me.Content16.Text = qContentCells(0).cell16.Trim()
        Me.Content17.Text = qContentCells(0).cell17.Trim()
        Me.Content18.Text = qContentCells(0).cell18.Trim()
        Me.Content19.Text = qContentCells(0).cell19.Trim()
        Me.Content20.Text = qContentCells(0).cell20.Trim()
        Me.Content21.Text = qContentCells(0).cell21.Trim()
        Me.Content22.Text = qContentCells(0).cell22.Trim()
        Me.Content23.Text = qContentCells(0).cell23.Trim()
        Me.Content24.Text = qContentCells(0).cell24.Trim()
        Me.Content25.Text = qContentCells(0).cell25.Trim()
        Me.Content26.Text = qContentCells(0).cell26.Trim()
        Me.Content27.Text = qContentCells(0).cell27.Trim()
        Me.Content28.Text = qContentCells(0).cell28.Trim()
        Me.Content29.Text = qContentCells(0).cell29.Trim()
        Me.Content30.Text = qContentCells(0).cell30.Trim()
        Me.Content31.Text = qContentCells(0).cell31.Trim()
        Me.Content32.Text = qContentCells(0).cell32.Trim()
        Me.Content33.Text = qContentCells(0).cell33.Trim()
        Me.Content34.Text = qContentCells(0).cell34.Trim()

        'Cateory
        Dim qCategoryCells = (From x In CellsSetting.<Category>
                              Select x.<cell1>.Value, x.<cell2>.Value, x.<cell3>.Value, x.<cell4>.Value,
                                 x.<cell5>.Value, x.<cell6>.Value, x.<cell7>.Value, x.<cell8>.Value,
                                 x.<cell9>.Value, x.<cell10>.Value, x.<cell11>.Value, x.<cell12>.Value,
                                 x.<cell13>.Value, x.<cell14>.Value, x.<cell15>.Value, x.<cell16>.Value,
                                 x.<cell17>.Value, x.<cell18>.Value, x.<cell19>.Value, x.<cell20>.Value,
                                 x.<cell21>.Value, x.<cell22>.Value, x.<cell23>.Value, x.<cell24>.Value,
                                 x.<cell25>.Value, x.<cell26>.Value, x.<cell27>.Value, x.<cell28>.Value,
                                 x.<cell29>.Value, x.<cell30>.Value, x.<cell31>.Value, x.<cell32>.Value,
                                 x.<cell33>.Value, x.<cell34>.Value).ToArray()

        Me.Category01.Text = qCategoryCells(0).cell1.Trim()
        Me.Category02.Text = qCategoryCells(0).cell2.Trim()
        Me.Category03.Text = qCategoryCells(0).cell3.Trim()
        Me.Category04.Text = qCategoryCells(0).cell4.Trim()
        Me.Category05.Text = qCategoryCells(0).cell5.Trim()
        Me.Category06.Text = qCategoryCells(0).cell6.Trim()
        Me.Category07.Text = qCategoryCells(0).cell7.Trim()
        Me.Category08.Text = qCategoryCells(0).cell8.Trim()
        Me.Category09.Text = qCategoryCells(0).cell9.Trim()
        Me.Category10.Text = qCategoryCells(0).cell10.Trim()
        Me.Category11.Text = qCategoryCells(0).cell11.Trim()
        Me.Category12.Text = qCategoryCells(0).cell12.Trim()
        Me.Category13.Text = qCategoryCells(0).cell13.Trim()
        Me.Category14.Text = qCategoryCells(0).cell14.Trim()
        Me.Category15.Text = qCategoryCells(0).cell15.Trim()
        Me.Category16.Text = qCategoryCells(0).cell16.Trim()
        Me.Category17.Text = qCategoryCells(0).cell17.Trim()
        Me.Category18.Text = qCategoryCells(0).cell18.Trim()
        Me.Category19.Text = qCategoryCells(0).cell19.Trim()
        Me.Category20.Text = qCategoryCells(0).cell20.Trim()
        Me.Category21.Text = qCategoryCells(0).cell21.Trim()
        Me.Category22.Text = qCategoryCells(0).cell22.Trim()
        Me.Category23.Text = qCategoryCells(0).cell23.Trim()
        Me.Category24.Text = qCategoryCells(0).cell24.Trim()
        Me.Category25.Text = qCategoryCells(0).cell25.Trim()
        Me.Category26.Text = qCategoryCells(0).cell26.Trim()
        Me.Category27.Text = qCategoryCells(0).cell27.Trim()
        Me.Category28.Text = qCategoryCells(0).cell28.Trim()
        Me.Category29.Text = qCategoryCells(0).cell29.Trim()
        Me.Category30.Text = qCategoryCells(0).cell30.Trim()
        Me.Category31.Text = qCategoryCells(0).cell31.Trim()
        Me.Category32.Text = qCategoryCells(0).cell32.Trim()
        Me.Category33.Text = qCategoryCells(0).cell33.Trim()
        Me.Category34.Text = qCategoryCells(0).cell34.Trim()



        Dim Dc As New MembersDataContext(strPdiConn)
        Dim qMember = (From x In Dc.tblmember Where x.show = 1 AndAlso x.team = 1).ToArray()
        For Each mem As tblmember In qMember
            ddListPerson1.Items.Add(mem.username_kanji)
            ddListPerson2.Items.Add(mem.username_kanji)
        Next


    End Sub



    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        'Try

        If Page.IsPostBack Then

            Else
                Me.setView()

                If Me.Session("searchKey") Is Nothing Then

                    Dim Dc As New Asr5500ChkSheetDataContext(strConn)
                    'Dim Query = (From x In Dc.asr5500_chksheets Order By x.id Descending).ToArray()

                    Dim Query = (From x In Dc.asr5500_chksheets
                                 Where x.date = Now
                                 Order By x.id Descending).ToArray()



                    If Query.Length = 0 Then
                        '1件もテーブルにない場合
                        Me.txtYear.Text = Now.ToString("yyyy/MM/dd")
                        Me.lblMsg.Text = "まだチェックシートを作成していません。"
                        Me.RBtnInsert.Checked = True



                    Else

                        Me.lblMsg.Text = "チェックシートを作成済です。"
                        Me.RBtnUpdate.Checked = True
                        Me.txtYear.Text = Query(0).date.ToString().Substring(0, 10)

                        setChkBox(Query)

                    End If

                Else

                    Dim Dc As New Asr5500ChkSheetDataContext(strConn)
                    Dim Query = (From x In Dc.asr5500_chksheets
                                 Where x.id = CInt(Session("searchKey"))
                                 Order By x.id Descending).ToArray()


                setChkBox(Query)
                Me.txtYear.Text = Query(0).date.ToString().Substring(0, 10)
                Me.RBtnUpdate.Checked = True


                Session.Remove("searchKey")

                End If

            End If

        'Catch ex As Exception
        '    Me.lblMsg.Text = ex.Message
        '    Exit Sub

        'End Try

    End Sub

    Protected Sub btnInsert_Click(sender As Object, e As EventArgs) Handles btnSubmit.Click
        'Try
        '入力値検証
        If Not Me.RBtnInsert.Checked AndAlso Not Me.RBtnUpdate.Checked And Not Me.RBtnDelete.Checked Then
                Me.lblMsg.Text = "モードが選択されていません。"
                Me.RBtnInsert.BackColor = System.Drawing.Color.Yellow
                Me.RBtnUpdate.BackColor = System.Drawing.Color.Yellow
                Me.RBtnDelete.BackColor = System.Drawing.Color.Yellow
                Me.RBtnInsert.Focus()

                Exit Sub
            Else
                Me.RBtnInsert.BackColor = System.Drawing.Color.White
                Me.RBtnUpdate.BackColor = System.Drawing.Color.White
                Me.RBtnDelete.BackColor = System.Drawing.Color.White

            End If


            '必須チェック
            If Me.txtYear.Text.Trim = "" Then
                Me.lblMsg.Text = "日付が入力されていません[必須入力]"
                Exit Sub
            End If

            '型チェック
            If Not Utility.IsDateFormat(Me.txtYear.Text) Then
                Me.lblMsg.Text = "日付は9999/99/99で入力してください。"
                Exit Sub

            End If


            '登録
            If Me.RBtnInsert.Checked Then
                If Me.IsRegisterd(Me.txtYear.Text.Trim) Then
                    Me.lblMsg.Text = "すでに作成されています。"
                    Exit Sub
                Else
                    Me.lblMsg.Text = ""
                End If

                Me.InsertData()
                Me.lblMsg.Text = "チェックシートを作成しました。"
                Exit Sub
            End If

            '修正
            If Me.RBtnUpdate.Checked Then
                UndateData()
                Exit Sub
            End If



            '削除
            If Me.RBtnDelete.Checked Then
                DeleteData()
                Exit Sub
            End If


        'Catch ex As Exception
        '    Me.lblMsg.Text = ex.Message
        '    Exit Sub
        'End Try
    End Sub


    Protected Sub btnSearch_Click(sender As Object, e As EventArgs) Handles btnSearch.Click
        'Try
        Response.Redirect("~/Search.aspx")
        'Catch ex As Exception
        '    Me.lblMsg.Text = ex.Message
        '    Exit Sub
        'End Try

    End Sub

    Protected Sub btnMail_Click(sender As Object, e As EventArgs) Handles btnMail.Click
        'Try
        Response.Redirect("~/MailForm.aspx")

        'Catch ex As Exception
        '    Me.lblMsg.Text = ex.Message
        '    Exit Sub
        'End Try

    End Sub
End Class