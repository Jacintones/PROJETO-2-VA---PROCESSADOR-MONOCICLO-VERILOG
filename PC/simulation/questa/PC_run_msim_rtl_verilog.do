<RadzenFormField Text="Código" Style="width: 100%;" class="rz-mb-4">
    <RadzenNumeric Min="0" @bind-Value="Request.Codigo" Style="width: 100%" />
</RadzenFormField>


<RadzenFormField Text="Motivo" Style="width: 100%;">
    <RadzenTextBox @bind-Value="@Request.Motivo" Style="width: 100%;" />
</RadzenFormField>

<div style="margin-top: 10px;">
    <RadzenText Text="@(MensagemSucesso)" Style="color:green; display:block; margin-bottom:5px;" />
    <RadzenText Text="@(MensagemError)" Style="color:red; display:block;" />
</div>

<div style="margin-top: 20px; display: flex; align-items: center; justify-content: center;">
    <RadzenButton Text="Salvar" ButtonStyle="ButtonStyle.Primary" Icon="save" Click="@Adicionar" />
    <RadzenButton Text="Cancelar" ButtonStyle="ButtonStyle.Light" Icon="highlight_off" class="rz-ml-2" Click="@Cancelar" />
</div>


public AdicionarAtualizarMotivoCancelamentoDocumentoFiscalRequest Request { get; set; } = new AdicionarAtualizarMotivoCancelamentoDocumentoFiscalRequest();
[Inject] public required IMotivoCancelamentoDocumentoFiscalAPI Service { get; set; }
public string? MensagemSucesso { get; set; }
public string? MensagemError { get; set; }
public async Task Adicionar()
{
    if (Request != null)
    {
        try
        {
            await this.Service.AdicionarAtualizar(Request);
            this.MensagemError = null;
            this.MensagemSucesso = "Motivo adicionado com sucesso!";
        }
        catch (System.Exception ex)
        {
            this.MensagemError = ex.Message;
            this.MensagemSucesso = null;
        }
    }
}