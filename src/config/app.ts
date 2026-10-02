export interface PageConfig {
  label: string;
  href: string;
  description: string;
  entities: string[];
  workflows: string[];
}

export interface EntityConfig {
  name: string;
  label: string;
  fields: Array<{ name: string; kind: "string" | "number" | "boolean" | "date" }>;
}

export interface WorkflowConfig {
  slug: string;
  title: string;
  description: string;
  prompt: string;
  fields: string[];
}

export const appConfig = {
  "slug": "ai-radioactive-waste-lifecycle-records",
  "title": "Radioactive Waste Lifecycle Records",
  "tagline": "Track waste packages, radionuclide records, storage, survey evidence, approved transfers and disposal receipts.",
  "accent": "rose"
};
export const pages: PageConfig[] = [
  {
    "label": "Intake & registers",
    "href": "/registers",
    "description": "Track waste packages, radionuclide records, storage, survey evidence, approved transfers and disposal receipts.",
    "entities": [
      "WasteProgram",
      "WastePackage",
      "WasteAddition"
    ],
    "workflows": [
      "manifest-extraction",
      "package-inventory-reconciliation"
    ]
  },
  {
    "label": "Operational records",
    "href": "/workflow",
    "description": "Track waste packages, radionuclide records, storage, survey evidence, approved transfers and disposal receipts.",
    "entities": [
      "StorageSurvey",
      "PackageInspection",
      "WasteTransfer"
    ],
    "workflows": [
      "survey-evidence-completeness",
      "transfer-packet-preparation"
    ]
  },
  {
    "label": "Review & delivery",
    "href": "/delivery",
    "description": "Track waste packages, radionuclide records, storage, survey evidence, approved transfers and disposal receipts.",
    "entities": [
      "WasteManifest",
      "DisposalReceipt",
      "WasteIncident"
    ],
    "workflows": [
      "incident-chronology",
      "waste-program-report-draft"
    ]
  },
  {
    "label": "Tasks & requirements",
    "href": "/operations",
    "description": "Assignments, versioned rules and document requirements.",
    "entities": [
      "OperationalTask",
      "RuleVersion",
      "DocumentRequirement"
    ],
    "workflows": [
      "evidence-completeness-review",
      "operations-handoff-draft"
    ]
  }
];
export const entities: Record<string, EntityConfig> = {
  "WasteProgram": {
    "name": "WasteProgram",
    "label": "Waste Program",
    "fields": [
      {
        "name": "name",
        "kind": "string"
      },
      {
        "name": "licenseNumber",
        "kind": "string"
      },
      {
        "name": "organization",
        "kind": "string"
      },
      {
        "name": "radiationOfficer",
        "kind": "string"
      },
      {
        "name": "location",
        "kind": "string"
      },
      {
        "name": "reviewAt",
        "kind": "date"
      },
      {
        "name": "status",
        "kind": "string"
      }
    ]
  },
  "WastePackage": {
    "name": "WastePackage",
    "label": "Waste Package",
    "fields": [
      {
        "name": "name",
        "kind": "string"
      },
      {
        "name": "packageNumber",
        "kind": "string"
      },
      {
        "name": "radionuclide",
        "kind": "string"
      },
      {
        "name": "activityBq",
        "kind": "number"
      },
      {
        "name": "measuredAt",
        "kind": "date"
      },
      {
        "name": "storageLocation",
        "kind": "string"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "wasteProgramId",
        "kind": "string"
      }
    ]
  },
  "WasteAddition": {
    "name": "WasteAddition",
    "label": "Waste Addition",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "wastePackageId",
        "kind": "string"
      },
      {
        "name": "addedAt",
        "kind": "date"
      },
      {
        "name": "activityBq",
        "kind": "number"
      },
      {
        "name": "volumeMl",
        "kind": "number"
      },
      {
        "name": "sourceReference",
        "kind": "string"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "wasteProgramId",
        "kind": "string"
      }
    ]
  },
  "StorageSurvey": {
    "name": "StorageSurvey",
    "label": "Storage Survey",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "wastePackageId",
        "kind": "string"
      },
      {
        "name": "surveyedAt",
        "kind": "date"
      },
      {
        "name": "instrument",
        "kind": "string"
      },
      {
        "name": "reading",
        "kind": "number"
      },
      {
        "name": "unit",
        "kind": "string"
      },
      {
        "name": "surveyor",
        "kind": "string"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "wasteProgramId",
        "kind": "string"
      }
    ]
  },
  "PackageInspection": {
    "name": "PackageInspection",
    "label": "Package Inspection",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "wastePackageId",
        "kind": "string"
      },
      {
        "name": "inspectedAt",
        "kind": "date"
      },
      {
        "name": "sealNumber",
        "kind": "string"
      },
      {
        "name": "observations",
        "kind": "string"
      },
      {
        "name": "inspector",
        "kind": "string"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "wasteProgramId",
        "kind": "string"
      }
    ]
  },
  "WasteTransfer": {
    "name": "WasteTransfer",
    "label": "Waste Transfer",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "wastePackageId",
        "kind": "string"
      },
      {
        "name": "transferredAt",
        "kind": "date"
      },
      {
        "name": "carrier",
        "kind": "string"
      },
      {
        "name": "destination",
        "kind": "string"
      },
      {
        "name": "authorizationReference",
        "kind": "string"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "wasteProgramId",
        "kind": "string"
      }
    ]
  },
  "WasteManifest": {
    "name": "WasteManifest",
    "label": "Waste Manifest",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "wastePackageId",
        "kind": "string"
      },
      {
        "name": "manifestNumber",
        "kind": "string"
      },
      {
        "name": "preparedAt",
        "kind": "date"
      },
      {
        "name": "contents",
        "kind": "string"
      },
      {
        "name": "recipient",
        "kind": "string"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "wasteProgramId",
        "kind": "string"
      }
    ]
  },
  "DisposalReceipt": {
    "name": "DisposalReceipt",
    "label": "Disposal Receipt",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "wastePackageId",
        "kind": "string"
      },
      {
        "name": "receivedAt",
        "kind": "date"
      },
      {
        "name": "facility",
        "kind": "string"
      },
      {
        "name": "method",
        "kind": "string"
      },
      {
        "name": "receipt",
        "kind": "string"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "wasteProgramId",
        "kind": "string"
      }
    ]
  },
  "WasteIncident": {
    "name": "WasteIncident",
    "label": "Waste Incident",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "wastePackageId",
        "kind": "string"
      },
      {
        "name": "observedAt",
        "kind": "date"
      },
      {
        "name": "description",
        "kind": "string"
      },
      {
        "name": "response",
        "kind": "string"
      },
      {
        "name": "reviewer",
        "kind": "string"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "wasteProgramId",
        "kind": "string"
      }
    ]
  },
  "OperationalTask": {
    "name": "OperationalTask",
    "label": "Operational Task",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "owner",
        "kind": "string"
      },
      {
        "name": "priority",
        "kind": "string"
      },
      {
        "name": "startAt",
        "kind": "date"
      },
      {
        "name": "dueAt",
        "kind": "date"
      },
      {
        "name": "done",
        "kind": "boolean"
      },
      {
        "name": "notes",
        "kind": "string"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "wasteProgramId",
        "kind": "string"
      }
    ]
  },
  "RuleVersion": {
    "name": "RuleVersion",
    "label": "Rule Version",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "jurisdiction",
        "kind": "string"
      },
      {
        "name": "version",
        "kind": "string"
      },
      {
        "name": "effectiveAt",
        "kind": "date"
      },
      {
        "name": "expiresAt",
        "kind": "date"
      },
      {
        "name": "sourceUrl",
        "kind": "string"
      },
      {
        "name": "requirementText",
        "kind": "string"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "wasteProgramId",
        "kind": "string"
      }
    ]
  },
  "DocumentRequirement": {
    "name": "DocumentRequirement",
    "label": "Document Requirement",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "category",
        "kind": "string"
      },
      {
        "name": "requiredBy",
        "kind": "date"
      },
      {
        "name": "sourceReference",
        "kind": "string"
      },
      {
        "name": "evidenceReference",
        "kind": "string"
      },
      {
        "name": "reviewNotes",
        "kind": "string"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "wasteProgramId",
        "kind": "string"
      }
    ]
  }
};
export const workflows: WorkflowConfig[] = [
  {
    "slug": "manifest-extraction",
    "title": "Manifest extraction",
    "description": "Manifest extraction using selected waste program records and supplied evidence.",
    "prompt": "Manifest extraction for Radioactive Waste Lifecycle Records. Operational scope: Track waste packages, radionuclide records, storage, survey evidence, approved transfers and disposal receipts. Specific AI scope: Extract manifests and flag inventory/document mismatches; licensed staff approve handling. Produce an editable, source-linked draft for the responsible professional. Distinguish observations, missing evidence and proposed next actions. Do not invent facts, decide legal eligibility, authorize clinical release, profile individuals, submit externally or invent calibrated probabilities. Use supplied rule versions only. For translation preserve identifiers, dates, names and numbers and mark uncertain terms.",
    "fields": [
      "objective",
      "sourceContext",
      "applicableRules",
      "knownDiscrepancies",
      "constraints",
      "requestedOutput",
      "optionalReviewerNotes",
      "optionalAdditionalEvidence"
    ]
  },
  {
    "slug": "package-inventory-reconciliation",
    "title": "Package inventory reconciliation",
    "description": "Package inventory reconciliation using selected waste program records and supplied evidence.",
    "prompt": "Package inventory reconciliation for Radioactive Waste Lifecycle Records. Operational scope: Track waste packages, radionuclide records, storage, survey evidence, approved transfers and disposal receipts. Specific AI scope: Extract manifests and flag inventory/document mismatches; licensed staff approve handling. Produce an editable, source-linked draft for the responsible professional. Distinguish observations, missing evidence and proposed next actions. Do not invent facts, decide legal eligibility, authorize clinical release, profile individuals, submit externally or invent calibrated probabilities. Use supplied rule versions only. For translation preserve identifiers, dates, names and numbers and mark uncertain terms.",
    "fields": [
      "objective",
      "sourceContext",
      "applicableRules",
      "knownDiscrepancies",
      "constraints",
      "requestedOutput",
      "optionalReviewerNotes",
      "optionalAdditionalEvidence"
    ]
  },
  {
    "slug": "survey-evidence-completeness",
    "title": "Survey evidence completeness",
    "description": "Survey evidence completeness using selected waste program records and supplied evidence.",
    "prompt": "Survey evidence completeness for Radioactive Waste Lifecycle Records. Operational scope: Track waste packages, radionuclide records, storage, survey evidence, approved transfers and disposal receipts. Specific AI scope: Extract manifests and flag inventory/document mismatches; licensed staff approve handling. Produce an editable, source-linked draft for the responsible professional. Distinguish observations, missing evidence and proposed next actions. Do not invent facts, decide legal eligibility, authorize clinical release, profile individuals, submit externally or invent calibrated probabilities. Use supplied rule versions only. For translation preserve identifiers, dates, names and numbers and mark uncertain terms.",
    "fields": [
      "objective",
      "sourceContext",
      "applicableRules",
      "knownDiscrepancies",
      "constraints",
      "requestedOutput",
      "optionalReviewerNotes",
      "optionalAdditionalEvidence"
    ]
  },
  {
    "slug": "transfer-packet-preparation",
    "title": "Transfer packet preparation",
    "description": "Transfer packet preparation using selected waste program records and supplied evidence.",
    "prompt": "Transfer packet preparation for Radioactive Waste Lifecycle Records. Operational scope: Track waste packages, radionuclide records, storage, survey evidence, approved transfers and disposal receipts. Specific AI scope: Extract manifests and flag inventory/document mismatches; licensed staff approve handling. Produce an editable, source-linked draft for the responsible professional. Distinguish observations, missing evidence and proposed next actions. Do not invent facts, decide legal eligibility, authorize clinical release, profile individuals, submit externally or invent calibrated probabilities. Use supplied rule versions only. For translation preserve identifiers, dates, names and numbers and mark uncertain terms.",
    "fields": [
      "objective",
      "sourceContext",
      "applicableRules",
      "knownDiscrepancies",
      "constraints",
      "requestedOutput",
      "optionalReviewerNotes",
      "optionalAdditionalEvidence"
    ]
  },
  {
    "slug": "incident-chronology",
    "title": "Incident chronology",
    "description": "Incident chronology using selected waste program records and supplied evidence.",
    "prompt": "Incident chronology for Radioactive Waste Lifecycle Records. Operational scope: Track waste packages, radionuclide records, storage, survey evidence, approved transfers and disposal receipts. Specific AI scope: Extract manifests and flag inventory/document mismatches; licensed staff approve handling. Produce an editable, source-linked draft for the responsible professional. Distinguish observations, missing evidence and proposed next actions. Do not invent facts, decide legal eligibility, authorize clinical release, profile individuals, submit externally or invent calibrated probabilities. Use supplied rule versions only. For translation preserve identifiers, dates, names and numbers and mark uncertain terms.",
    "fields": [
      "objective",
      "sourceContext",
      "applicableRules",
      "knownDiscrepancies",
      "constraints",
      "requestedOutput",
      "optionalReviewerNotes",
      "optionalAdditionalEvidence"
    ]
  },
  {
    "slug": "waste-program-report-draft",
    "title": "Waste program report draft",
    "description": "Waste program report draft using selected waste program records and supplied evidence.",
    "prompt": "Waste program report draft for Radioactive Waste Lifecycle Records. Operational scope: Track waste packages, radionuclide records, storage, survey evidence, approved transfers and disposal receipts. Specific AI scope: Extract manifests and flag inventory/document mismatches; licensed staff approve handling. Produce an editable, source-linked draft for the responsible professional. Distinguish observations, missing evidence and proposed next actions. Do not invent facts, decide legal eligibility, authorize clinical release, profile individuals, submit externally or invent calibrated probabilities. Use supplied rule versions only. For translation preserve identifiers, dates, names and numbers and mark uncertain terms.",
    "fields": [
      "objective",
      "sourceContext",
      "applicableRules",
      "knownDiscrepancies",
      "constraints",
      "requestedOutput",
      "optionalReviewerNotes",
      "optionalAdditionalEvidence"
    ]
  },
  {
    "slug": "evidence-completeness-review",
    "title": "Evidence completeness review",
    "description": "Evidence completeness review using selected waste program records and supplied evidence.",
    "prompt": "Evidence completeness review for Radioactive Waste Lifecycle Records. Operational scope: Track waste packages, radionuclide records, storage, survey evidence, approved transfers and disposal receipts. Specific AI scope: Extract manifests and flag inventory/document mismatches; licensed staff approve handling. Produce an editable, source-linked draft for the responsible professional. Distinguish observations, missing evidence and proposed next actions. Do not invent facts, decide legal eligibility, authorize clinical release, profile individuals, submit externally or invent calibrated probabilities. Use supplied rule versions only. For translation preserve identifiers, dates, names and numbers and mark uncertain terms.",
    "fields": [
      "objective",
      "sourceContext",
      "applicableRules",
      "knownDiscrepancies",
      "constraints",
      "requestedOutput",
      "optionalReviewerNotes",
      "optionalAdditionalEvidence"
    ]
  },
  {
    "slug": "operations-handoff-draft",
    "title": "Operations handoff draft",
    "description": "Operations handoff draft using selected waste program records and supplied evidence.",
    "prompt": "Operations handoff draft for Radioactive Waste Lifecycle Records. Operational scope: Track waste packages, radionuclide records, storage, survey evidence, approved transfers and disposal receipts. Specific AI scope: Extract manifests and flag inventory/document mismatches; licensed staff approve handling. Produce an editable, source-linked draft for the responsible professional. Distinguish observations, missing evidence and proposed next actions. Do not invent facts, decide legal eligibility, authorize clinical release, profile individuals, submit externally or invent calibrated probabilities. Use supplied rule versions only. For translation preserve identifiers, dates, names and numbers and mark uncertain terms.",
    "fields": [
      "objective",
      "sourceContext",
      "applicableRules",
      "knownDiscrepancies",
      "constraints",
      "requestedOutput",
      "optionalReviewerNotes",
      "optionalAdditionalEvidence"
    ]
  }
];
export function findPage(href:string){return pages.find(p=>p.href===href);}
