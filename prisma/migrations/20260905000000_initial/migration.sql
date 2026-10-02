-- CreateEnum
CREATE TYPE "Role" AS ENUM ('ADMIN', 'MANAGER', 'ANALYST');

-- CreateTable
CREATE TABLE "User" (
    "active" BOOLEAN NOT NULL DEFAULT true,
    "id" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "passwordHash" TEXT NOT NULL,
    "role" "Role" NOT NULL DEFAULT 'ANALYST',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "AuditLog" (
    "id" TEXT NOT NULL,
    "actorId" TEXT,
    "actorName" TEXT,
    "action" TEXT NOT NULL,
    "entity" TEXT NOT NULL,
    "entityId" TEXT,
    "detail" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "AuditLog_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "WorkflowAnalysis" (
    "id" TEXT NOT NULL,
    "actorId" TEXT NOT NULL,
    "workflow" TEXT NOT NULL,
    "subjectEntity" TEXT NOT NULL,
    "subjectId" TEXT NOT NULL,
    "input" JSONB NOT NULL,
    "evidence" JSONB NOT NULL,
    "evidenceHash" TEXT NOT NULL,
    "result" JSONB NOT NULL,
    "model" TEXT NOT NULL,
    "receipt" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "WorkflowAnalysis_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RecordReview" (
    "id" TEXT NOT NULL,
    "actorId" TEXT NOT NULL,
    "entity" TEXT NOT NULL,
    "entityId" TEXT NOT NULL,
    "version" TEXT NOT NULL,
    "reason" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "RecordReview_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "UsageBucket" (
    "id" TEXT NOT NULL,
    "calls" INTEGER NOT NULL,

    CONSTRAINT "UsageBucket_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "IssuedCredential" (
    "token" TEXT NOT NULL,
    "entity" TEXT NOT NULL,
    "entityId" TEXT NOT NULL,
    "version" TEXT NOT NULL,
    "assertion" JSONB NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "revokedAt" TIMESTAMP(3),

    CONSTRAINT "IssuedCredential_pkey" PRIMARY KEY ("token")
);

-- CreateTable
CREATE TABLE "DomainArtifact" (
    "id" TEXT NOT NULL,
    "subjectEntity" TEXT NOT NULL,
    "subjectId" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "content" TEXT NOT NULL,
    "contentHash" TEXT NOT NULL,
    "actorId" TEXT NOT NULL,
    "approvedBy" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "DomainArtifact_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RecordApproval" (
    "id" TEXT NOT NULL,
    "version" TEXT NOT NULL,

    CONSTRAINT "RecordApproval_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "DomainExecution" (
    "id" TEXT NOT NULL,
    "actorId" TEXT NOT NULL,
    "connectorId" TEXT NOT NULL,
    "action" TEXT NOT NULL,
    "subjectEntity" TEXT NOT NULL,
    "subjectId" TEXT NOT NULL,
    "version" TEXT NOT NULL,
    "status" TEXT NOT NULL,
    "result" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "DomainExecution_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "WorkSession" (
    "id" TEXT NOT NULL,
    "actorId" TEXT NOT NULL,
    "respondentId" TEXT NOT NULL,
    "subjectEntity" TEXT NOT NULL,
    "subjectId" TEXT NOT NULL,
    "questions" JSONB NOT NULL,
    "answers" JSONB NOT NULL,
    "currentQuestion" TEXT,
    "status" TEXT NOT NULL,
    "deadline" TIMESTAMP(3) NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "WorkSession_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "SessionMedia" (
    "id" TEXT NOT NULL,
    "sessionId" TEXT NOT NULL,
    "questionId" TEXT NOT NULL,
    "actorId" TEXT NOT NULL,
    "contentType" TEXT NOT NULL,
    "bytes" BYTEA NOT NULL,
    "contentHash" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "SessionMedia_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "AppSetting" (
    "id" TEXT NOT NULL,
    "value" JSONB NOT NULL,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "AppSetting_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "WasteProgram" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "licenseNumber" TEXT NOT NULL,
    "organization" TEXT NOT NULL,
    "radiationOfficer" TEXT NOT NULL,
    "location" TEXT NOT NULL,
    "reviewAt" TIMESTAMP(3) NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "WasteProgram_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "WastePackage" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "packageNumber" TEXT NOT NULL,
    "radionuclide" TEXT NOT NULL,
    "activityBq" DOUBLE PRECISION NOT NULL,
    "measuredAt" TIMESTAMP(3) NOT NULL,
    "storageLocation" TEXT NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "wasteProgramId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "WastePackage_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "WasteAddition" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "wastePackageId" TEXT NOT NULL,
    "addedAt" TIMESTAMP(3) NOT NULL,
    "activityBq" DOUBLE PRECISION NOT NULL,
    "volumeMl" DOUBLE PRECISION NOT NULL,
    "sourceReference" TEXT NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "wasteProgramId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "WasteAddition_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "StorageSurvey" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "wastePackageId" TEXT NOT NULL,
    "surveyedAt" TIMESTAMP(3) NOT NULL,
    "instrument" TEXT NOT NULL,
    "reading" DOUBLE PRECISION NOT NULL,
    "unit" TEXT NOT NULL,
    "surveyor" TEXT NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "wasteProgramId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "StorageSurvey_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PackageInspection" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "wastePackageId" TEXT NOT NULL,
    "inspectedAt" TIMESTAMP(3) NOT NULL,
    "sealNumber" TEXT NOT NULL,
    "observations" TEXT NOT NULL,
    "inspector" TEXT NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "wasteProgramId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "PackageInspection_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "WasteTransfer" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "wastePackageId" TEXT NOT NULL,
    "transferredAt" TIMESTAMP(3) NOT NULL,
    "carrier" TEXT NOT NULL,
    "destination" TEXT NOT NULL,
    "authorizationReference" TEXT NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "wasteProgramId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "WasteTransfer_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "WasteManifest" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "wastePackageId" TEXT NOT NULL,
    "manifestNumber" TEXT NOT NULL,
    "preparedAt" TIMESTAMP(3) NOT NULL,
    "contents" TEXT NOT NULL,
    "recipient" TEXT NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "wasteProgramId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "WasteManifest_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "DisposalReceipt" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "wastePackageId" TEXT NOT NULL,
    "receivedAt" TIMESTAMP(3) NOT NULL,
    "facility" TEXT NOT NULL,
    "method" TEXT NOT NULL,
    "receipt" TEXT NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "wasteProgramId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "DisposalReceipt_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "WasteIncident" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "wastePackageId" TEXT NOT NULL,
    "observedAt" TIMESTAMP(3) NOT NULL,
    "description" TEXT NOT NULL,
    "response" TEXT NOT NULL,
    "reviewer" TEXT NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "wasteProgramId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "WasteIncident_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "OperationalTask" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "owner" TEXT NOT NULL,
    "priority" TEXT NOT NULL,
    "startAt" TIMESTAMP(3) NOT NULL,
    "dueAt" TIMESTAMP(3) NOT NULL,
    "done" BOOLEAN NOT NULL,
    "notes" TEXT,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "wasteProgramId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "OperationalTask_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RuleVersion" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "jurisdiction" TEXT NOT NULL,
    "version" TEXT NOT NULL,
    "effectiveAt" TIMESTAMP(3) NOT NULL,
    "expiresAt" TIMESTAMP(3),
    "sourceUrl" TEXT NOT NULL,
    "requirementText" TEXT NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "wasteProgramId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "RuleVersion_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "DocumentRequirement" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "category" TEXT NOT NULL,
    "requiredBy" TIMESTAMP(3) NOT NULL,
    "sourceReference" TEXT NOT NULL,
    "evidenceReference" TEXT,
    "reviewNotes" TEXT,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "wasteProgramId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "DocumentRequirement_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");

-- CreateIndex
CREATE INDEX "WorkflowAnalysis_workflow_createdAt_idx" ON "WorkflowAnalysis"("workflow", "createdAt");

-- CreateIndex
CREATE UNIQUE INDEX "RecordReview_entity_entityId_version_actorId_key" ON "RecordReview"("entity", "entityId", "version", "actorId");

-- CreateIndex
CREATE INDEX "IssuedCredential_entity_entityId_createdAt_idx" ON "IssuedCredential"("entity", "entityId", "createdAt");

-- CreateIndex
CREATE INDEX "DomainArtifact_subjectEntity_subjectId_idx" ON "DomainArtifact"("subjectEntity", "subjectId");

-- CreateIndex
CREATE INDEX "WorkSession_respondentId_createdAt_idx" ON "WorkSession"("respondentId", "createdAt");

-- CreateIndex
CREATE INDEX "SessionMedia_sessionId_idx" ON "SessionMedia"("sessionId");

-- CreateIndex
CREATE INDEX "WasteProgram_createdAt_idx" ON "WasteProgram"("createdAt");

-- CreateIndex
CREATE INDEX "WastePackage_createdAt_idx" ON "WastePackage"("createdAt");

-- CreateIndex
CREATE INDEX "WastePackage_wasteProgramId_idx" ON "WastePackage"("wasteProgramId");

-- CreateIndex
CREATE INDEX "WasteAddition_createdAt_idx" ON "WasteAddition"("createdAt");

-- CreateIndex
CREATE INDEX "WasteAddition_wasteProgramId_idx" ON "WasteAddition"("wasteProgramId");

-- CreateIndex
CREATE INDEX "StorageSurvey_createdAt_idx" ON "StorageSurvey"("createdAt");

-- CreateIndex
CREATE INDEX "StorageSurvey_wasteProgramId_idx" ON "StorageSurvey"("wasteProgramId");

-- CreateIndex
CREATE INDEX "PackageInspection_createdAt_idx" ON "PackageInspection"("createdAt");

-- CreateIndex
CREATE INDEX "PackageInspection_wasteProgramId_idx" ON "PackageInspection"("wasteProgramId");

-- CreateIndex
CREATE INDEX "WasteTransfer_createdAt_idx" ON "WasteTransfer"("createdAt");

-- CreateIndex
CREATE INDEX "WasteTransfer_wasteProgramId_idx" ON "WasteTransfer"("wasteProgramId");

-- CreateIndex
CREATE INDEX "WasteManifest_createdAt_idx" ON "WasteManifest"("createdAt");

-- CreateIndex
CREATE INDEX "WasteManifest_wasteProgramId_idx" ON "WasteManifest"("wasteProgramId");

-- CreateIndex
CREATE INDEX "DisposalReceipt_createdAt_idx" ON "DisposalReceipt"("createdAt");

-- CreateIndex
CREATE INDEX "DisposalReceipt_wasteProgramId_idx" ON "DisposalReceipt"("wasteProgramId");

-- CreateIndex
CREATE INDEX "WasteIncident_createdAt_idx" ON "WasteIncident"("createdAt");

-- CreateIndex
CREATE INDEX "WasteIncident_wasteProgramId_idx" ON "WasteIncident"("wasteProgramId");

-- CreateIndex
CREATE INDEX "OperationalTask_createdAt_idx" ON "OperationalTask"("createdAt");

-- CreateIndex
CREATE INDEX "OperationalTask_wasteProgramId_idx" ON "OperationalTask"("wasteProgramId");

-- CreateIndex
CREATE INDEX "RuleVersion_createdAt_idx" ON "RuleVersion"("createdAt");

-- CreateIndex
CREATE INDEX "RuleVersion_wasteProgramId_idx" ON "RuleVersion"("wasteProgramId");

-- CreateIndex
CREATE INDEX "DocumentRequirement_createdAt_idx" ON "DocumentRequirement"("createdAt");

-- CreateIndex
CREATE INDEX "DocumentRequirement_wasteProgramId_idx" ON "DocumentRequirement"("wasteProgramId");

-- AddForeignKey
ALTER TABLE "WastePackage" ADD CONSTRAINT "WastePackage_wasteProgramId_fkey" FOREIGN KEY ("wasteProgramId") REFERENCES "WasteProgram"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "WasteAddition" ADD CONSTRAINT "WasteAddition_wastePackageId_fkey" FOREIGN KEY ("wastePackageId") REFERENCES "WastePackage"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "WasteAddition" ADD CONSTRAINT "WasteAddition_wasteProgramId_fkey" FOREIGN KEY ("wasteProgramId") REFERENCES "WasteProgram"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "StorageSurvey" ADD CONSTRAINT "StorageSurvey_wastePackageId_fkey" FOREIGN KEY ("wastePackageId") REFERENCES "WastePackage"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "StorageSurvey" ADD CONSTRAINT "StorageSurvey_wasteProgramId_fkey" FOREIGN KEY ("wasteProgramId") REFERENCES "WasteProgram"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PackageInspection" ADD CONSTRAINT "PackageInspection_wastePackageId_fkey" FOREIGN KEY ("wastePackageId") REFERENCES "WastePackage"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PackageInspection" ADD CONSTRAINT "PackageInspection_wasteProgramId_fkey" FOREIGN KEY ("wasteProgramId") REFERENCES "WasteProgram"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "WasteTransfer" ADD CONSTRAINT "WasteTransfer_wastePackageId_fkey" FOREIGN KEY ("wastePackageId") REFERENCES "WastePackage"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "WasteTransfer" ADD CONSTRAINT "WasteTransfer_wasteProgramId_fkey" FOREIGN KEY ("wasteProgramId") REFERENCES "WasteProgram"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "WasteManifest" ADD CONSTRAINT "WasteManifest_wastePackageId_fkey" FOREIGN KEY ("wastePackageId") REFERENCES "WastePackage"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "WasteManifest" ADD CONSTRAINT "WasteManifest_wasteProgramId_fkey" FOREIGN KEY ("wasteProgramId") REFERENCES "WasteProgram"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DisposalReceipt" ADD CONSTRAINT "DisposalReceipt_wastePackageId_fkey" FOREIGN KEY ("wastePackageId") REFERENCES "WastePackage"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DisposalReceipt" ADD CONSTRAINT "DisposalReceipt_wasteProgramId_fkey" FOREIGN KEY ("wasteProgramId") REFERENCES "WasteProgram"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "WasteIncident" ADD CONSTRAINT "WasteIncident_wastePackageId_fkey" FOREIGN KEY ("wastePackageId") REFERENCES "WastePackage"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "WasteIncident" ADD CONSTRAINT "WasteIncident_wasteProgramId_fkey" FOREIGN KEY ("wasteProgramId") REFERENCES "WasteProgram"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "OperationalTask" ADD CONSTRAINT "OperationalTask_wasteProgramId_fkey" FOREIGN KEY ("wasteProgramId") REFERENCES "WasteProgram"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RuleVersion" ADD CONSTRAINT "RuleVersion_wasteProgramId_fkey" FOREIGN KEY ("wasteProgramId") REFERENCES "WasteProgram"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DocumentRequirement" ADD CONSTRAINT "DocumentRequirement_wasteProgramId_fkey" FOREIGN KEY ("wasteProgramId") REFERENCES "WasteProgram"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

