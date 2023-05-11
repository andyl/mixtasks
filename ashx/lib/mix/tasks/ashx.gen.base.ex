defmodule Mix.Tasks.Ashx.Gen.Base do
  use Mix.Task

  @shortdoc "Generate Ash Base assets"

  @moduledoc """
  Generates base assets for an Ash application.

  Follows the (Get Started Tutorial)[1] in the Ash documentation.

  Takes one optional argument: `namespace` which puts the Ash-generated assets
  under a namespace directory.

      mix ashx.base.gen
      mix ashx.base.gen --namespace <directory>
      mix ashx.base.gen -n <directory>

  [1]: https://ash-hq.org/docs/guides/ash/latest/tutorials/get-started

  Generator actions:
  - [ ] adds latest version of ash to the deps section of `mix.exs`
  - [ ] generates ash directories
  - [ ] generates ticket resource `ticket.ex`
  - [ ] generates representative resource `representative.ex`
  - [ ] generates resource registry `registry.ex`
  - [ ] generates API `support.ex`
  - [ ] generates demo scripts
  - [ ] outputs instructions on how to update `config/config.exs`
  - [ ] outputs instructions on how to update `.formatter.exs`
  - [ ] outputs instructions on commands to run

  This setup uses ETS for persistence - data is wiped out when the server stops.
  """

  import Mix.Generator

  def run(argv) do
    IO.puts("This is ashx.gen.base")
    parse_args(argv)
    |> add_ash_package()
    |> gen_dirs()
    |> gen_ticket()
    |> gen_representative()
    |> gen_registry()
    |> gen_support_api()
    |> gen_demo_scripts()
    |> output_config_instructions()
    |> output_formatter_instructions()
    |> output_command_instructions()
  end

  def parse_args(argv) do
    opts = [
      strict: [namespace: :string],
      aliases: [n: :namespace]
    ]

    {args, _, _} = OptionParser.parse(argv, opts)

    %{
      namespace: Keyword.get(args, :namespace),
      appname: File.cwd!() |> Path.basename()
    }
  end

  def add_ash_package(domain) do
    file = "./mix.exs"
    itxt = File.read!(file)
    spec = GenUtil.Package.latest("ash")
    {:ok, otxt} = GenUtil.Injector.mix_dependency_inject(itxt, spec)
    File.write!(file, otxt)
    GenUtil.Msg.injected("#{spec} into mix.exs")
    domain
  end

  def gen_dirs(domain) do
    base_dir = "lib/" <> GenUtil.Domain.path(domain)
    create_directory(base_dir <> "/support")
    create_directory(base_dir <> "/support/resources")
    domain
  end

  def gen_ticket(domain) do
    tgt_path = base_dir(domain) <> "/support/resources/ticket.ex"
    args = [ appmod: GenUtil.Domain.appmod(domain) ]
    template("ticket.ex") |> copy_template(tgt_path, args)
    domain
  end

  def gen_representative(domain) do
    tgt_path = base_dir(domain) <> "/support/resources/representative.ex"
    args = [ appmod: GenUtil.Domain.appmod(domain) ]
    template("representative.ex") |> copy_template(tgt_path, args)
    domain
  end

  def gen_registry(domain) do
    tgt_path = base_dir(domain) <> "/support/afm_registry.ex"
    args = [ appmod: GenUtil.Domain.appmod(domain) ]
    template("afm_registry.ex") |> copy_template(tgt_path, args)
    domain
  end

  def gen_support_api(domain) do
    tgt_path = base_dir(domain) <> "/support.ex"
    args = [ appmod: GenUtil.Domain.appmod(domain) ]
    template("support.ex") |> copy_template(tgt_path, args)
    domain
  end

  def gen_demo_scripts(domain) do
    domain
  end

  def output_config_instructions(domain) do
    msg = """
    Create a file at config/config.exs with the following contents. If you
    already have one, just add the last line.

        import Config

        # if you already have a config file, then you'll just need to add this:
        config :ash, :use_all_identities_in_manage_relationship?, false
    """

    IO.puts(" ")
    GenUtil.Msg.instructions("config", msg)
    domain
  end

  def output_formatter_instructions(domain) do
    msg = """
    Add :ash to your .formatter.exs file

        # Used by "mix format"
        [
          import_deps: [:ash], # <-- add this line, if you have more import_deps, just add it within the array
          inputs: [
            "{mix,.formatter}.exs",
            "{config,lib,test}/**/*.{ex,exs}"
          ]
        ]
    """

    GenUtil.Msg.instructions("formatter", msg)
    domain
  end

  def output_command_instructions(domain) do
    msg = """
    Finally, run the following commands:

        $> mix deps.get
        $> mix deps.compile
    """

    GenUtil.Msg.instructions("commands", msg)
    domain
  end

  defp template(file) do
    relbase = "../../../priv/templates/ashx.gen.base/"
    relpath = relbase <> file
    basedir = Path.dirname(__ENV__.file)
    Path.expand(relpath, basedir)
  end

  defp base_dir(domain) do
    "lib/" <> GenUtil.Domain.path(domain)
  end

end
