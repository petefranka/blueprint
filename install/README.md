# Installing Blueprint

Blueprint can be installed globally for Claude Code or into one project.

## Global installation

To make Blueprint available from every project, run this command from the
Blueprint repository:

```bash
./install/install-global.sh
```

This installs the commands and agents into `~/.claude/` and stores the shared
methodology and templates in `~/.claude/blueprint/`. It does not add files to
any project. Open any project in Claude Code and run:

```
/blueprint
```

Generated `intent/` files are written to the project you are currently
working in.

## Project-local installation

Use the project-local installer when the Blueprint commands and supporting
files should be checked into or isolated within one project.

1. Download or clone this repo somewhere, e.g. `~/tools/blueprint`.
2. Run the install script against your project:

   ```bash
   ~/tools/blueprint/install/install.sh /path/to/your-project
   ```

   With no path given, it installs into the current folder.

3. This adds, inside your project:

   ```
   your-project/
   ├── .claude/
   │   ├── commands/   (blueprint.md, blueprint-continue.md)
   │   └── agents/     (9 subagents)
   ├── methodology/     (copied in so the above can reference it)
   ├── templates/
   └── intent/          (empty — this is where output goes)
   ```

4. Open the project in Claude Code. Add whatever design material you have
   — screenshots, notes, exports — anywhere in the project.

5. Run:

   ```
   /blueprint
   ```

   Review and edit `intent/BLUEPRINT.md`, then run:

   ```
   /blueprint-continue
   ```

## Updating

Run `install.sh` again against the same project. It replaces the command,
agent, and methodology files, but never touches anything in `intent/` —
your generated documents and open decisions are safe.

## Uninstalling Blueprint

From the Blueprint repository, remove a project-local installation with:

```bash
./install/uninstall-agent.sh /path/to/your/project
```

Remove the global installation with:

```bash
./install/uninstall-agent.sh --global
```

The script removes Blueprint's commands, agents, methodology, and templates.
For a project install, it removes only files represented by the current
Blueprint source tree and leaves unrelated project files in those folders
alone. It refuses to target the Blueprint source repository. Generated
`intent/` files are always preserved. Start a new Claude Code session after
removal.
