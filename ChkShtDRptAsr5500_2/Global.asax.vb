Imports System.Web.SessionState

Public Class Global_asax
    Inherits System.Web.HttpApplication

    Sub Application_Start(ByVal sender As Object, ByVal e As EventArgs)
        ' アプリケーションの起動時に呼び出されます
    End Sub

    Sub Session_Start(ByVal sender As Object, ByVal e As EventArgs)
        ' セッションの開始時に呼び出されます
    End Sub

    Sub Application_BeginRequest(ByVal sender As Object, ByVal e As EventArgs)
        ' 各要求の開始時に呼び出されます
    End Sub

    Sub Application_AuthenticateRequest(ByVal sender As Object, ByVal e As EventArgs)
        ' 使用の認証時に呼び出されます
    End Sub

    Sub Application_Error(ByVal sender As Object, ByVal e As EventArgs)
        '' エラーの発生時に呼び出されます
        Try
            Dim message As StringBuilder = New StringBuilder()

            If (Server IsNot Nothing) Then

                ' 例外の内容を取得し、StringBuilder に格納する
                Dim ex As Exception = Server.GetLastError()
                While ex IsNot Nothing

                    message.AppendFormat("{0}: {1}{2}", ex.GetType().FullName, ex.Message, ex.StackTrace)

                    ex = ex.InnerException
                End While

                '
                ' 例外情報と内部例外情報をログとして出力する処理など
                '

                Dim File As String = My.Settings("ErrorLog").ToString()
                Using Writer As New IO.StreamWriter(File, True, Text.Encoding.UTF8)
                    Writer.WriteLine("ChkShtError" & DateTime.Now.ToString())
                    Writer.WriteLine(message)
                    Writer.Close()
                End Using


                ' 例外をクリア（カスタムエラーページを設定している場合はコメントアウトすること）
                'Server.ClearError()
            End If

        Catch ex As Exception

        End Try

    End Sub

    Sub Session_End(ByVal sender As Object, ByVal e As EventArgs)
        ' セッションの終了時に呼び出されます
    End Sub

    Sub Application_End(ByVal sender As Object, ByVal e As EventArgs)
        ' アプリケーションの終了時に呼び出されます
    End Sub

End Class