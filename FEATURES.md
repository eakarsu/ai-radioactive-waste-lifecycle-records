# Radioactive Waste Lifecycle Records

Track waste packages, radionuclide records, storage, survey evidence, approved transfers and disposal receipts.

## Implemented records

- **Waste Program**: name, license Number, organization, radiation Officer, location, review At, status.
- **Waste Package**: name, package Number, radionuclide, activity Bq, measured At, storage Location, status.
- **Waste Addition**: title, added At, activity Bq, volume Ml, source Reference, status.
- **Storage Survey**: title, surveyed At, instrument, reading, unit, surveyor, status.
- **Package Inspection**: title, inspected At, seal Number, observations, inspector, status.
- **Waste Transfer**: title, transferred At, carrier, destination, authorization Reference, status.
- **Waste Manifest**: title, manifest Number, prepared At, contents, recipient, status.
- **Disposal Receipt**: title, received At, facility, method, receipt, status.
- **Waste Incident**: title, observed At, description, response, reviewer, status.
- **Operational Task**: title, owner, priority, start At, due At, done, notes, status.
- **Rule Version**: title, jurisdiction, version, effective At, expires At, source Url, requirement Text, status.
- **Document Requirement**: title, category, required By, source Reference, evidence Reference, review Notes, status.

## AI workflows

- Manifest extraction: source-linked draft, saved history, three real AI input suggestion styles and three complete fictional examples.
- Package inventory reconciliation: source-linked draft, saved history, three real AI input suggestion styles and three complete fictional examples.
- Survey evidence completeness: source-linked draft, saved history, three real AI input suggestion styles and three complete fictional examples.
- Transfer packet preparation: source-linked draft, saved history, three real AI input suggestion styles and three complete fictional examples.
- Incident chronology: source-linked draft, saved history, three real AI input suggestion styles and three complete fictional examples.
- Waste program report draft: source-linked draft, saved history, three real AI input suggestion styles and three complete fictional examples.
- Evidence completeness review: source-linked draft, saved history, three real AI input suggestion styles and three complete fictional examples.
- Operations handoff draft: source-linked draft, saved history, three real AI input suggestion styles and three complete fictional examples.

## Calculations

- Waste package volume reconciliation: Reconcile physical waste volume records. Does not calculate clearance, prescribe handling or authorize disposal.
- Waste Program evidence checklist: Check source presence against an explicitly supplied document list; reviewer assesses adequacy.
- Operational deadline queue: Compute overdue items from entered dates and completed flags; no external notifications.

## Workspace features

Role-based login and account management; validated create/edit/delete; required parent and sibling relationships; search and pagination; atomic JSON imports; CSV/JSON exports; optimistic concurrency; two independent human reviews; immutable source-text uploads with independent review; dated task calendar; aggregate reports; searchable audit trail; model catalog and administrator AI settings; configured HTTPS connectors with approval, idempotency and receipt checks.

## Integration boundaries

A finite working scope, not every conceivable feature. No production regulator, insurer, carrier, court, university or clinical integration is preconfigured. Source uploads support text/CSV/JSON/Markdown, not OCR/PDF parsing. AI produces drafts and cannot authorize clinical handling, adjudicate rights, select recipients or jurors, establish eligibility, certify regulatory compliance or send submissions. Live external execution requires a configured adapter and independent human approval of the current record. Calculations use supplied rules and units; example rules are fictional.
