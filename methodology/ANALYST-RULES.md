# Shared analyst rules

Use these rules for every Blueprint analyst report.

## Claims

- **Observation:** directly present in supplied evidence.
- **Intent:** product behavior or outcome supported by observations.
- **Inference:** strongly implied but not directly shown.
- **Assumption:** a reasonable default that is not confirmed.
- **Unknown:** cannot be determined from supplied evidence.

Never upgrade an inference, assumption, or unknown into an observation.
Every material claim must cite a source reference from the supplied
evidence packet.

## Uncertainty

- A consequential unresolved behavior becomes a **Decision**.
- A minor point with a clear default becomes an explicit **Assumption**.
- A low-impact unknowable remains **Unknown**.
- Material outside the approved boundary is **Out of Scope**.

Do not settle decisions or invent missing evidence.

## Language and output

Describe product behavior, not implementation. Apply
`methodology/validation/tech-leakage-validator.md` when a technical term
appears relevant.

Return only findings needed to populate the compact intent schema. Do not
add an introduction, conclusion, recap, implementation advice, or repeat
source material. Use short declarative bullets, one material claim per
bullet, with source IDs. State each idea once and report only findings
owned by the assigned role or roles.