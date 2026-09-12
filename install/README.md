# Installing Blueprint

Blueprint installs *into* whatever project you want to analyze — it
copies its commands and agents into that project's `.claude/` folder.

## Steps

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
   │   └── agents/     (8 subagents)
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

   Review and edit `intent/feature-map.md`, then run:

   ```
   /blueprint-continue
   ```

## Updating

Run `install.sh` again against the same project. It replaces the command,
agent, and methodology files, but never touches anything in `intent/` —
your generated documents and open decisions are safe.

## Removing it

Delete the files listed in step 3. Your `intent/` output is yours to keep
or delete separately.
