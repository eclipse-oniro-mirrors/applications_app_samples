/** Real workspace recycle policy; no sample records or rule catalogue. */
export const NOTE_RECYCLE_RETENTION_MS: number = 30 * 24 * 60 * 60 * 1000;
export const MAX_ACTIVE_NOTES: number = 50;
export const MAX_RECYCLED_NOTES: number = 50;
export const MAX_WORKSPACE_HISTORY: number = 100;
export const MAX_WORKSPACE_BYTES: number = 8 * 1024 * 1024;

export enum TrashEditDecision {
  REQUIRE_DECISION = 'require-decision',
  KEEP_CHANGES = 'keep-changes',
  DISCARD_CHANGES = 'discard-changes',
  CANCEL = 'cancel'
}

export class TrashCleanupResult {
  public success: boolean = false;
  public removed: number = 0;
  public message: string = '';
  constructor(success: boolean = false, removed: number = 0, message: string = '') {
    this.success = success;
    this.removed = removed;
    this.message = message;
  }
}

export function isTrashExpired(deletedAt: number, now: number): boolean {
  return Number.isFinite(deletedAt) && Number.isFinite(now) &&
    deletedAt >= 0 && now > deletedAt && now - deletedAt > NOTE_RECYCLE_RETENTION_MS;
}

export function trashDaysRemaining(deletedAt: number, now: number): number {
  if (!Number.isFinite(deletedAt) || !Number.isFinite(now)) { return 0; }
  const age: number = Math.max(0, now - deletedAt);
  return Math.max(0, Math.ceil((NOTE_RECYCLE_RETENTION_MS - age) / 86400000));
}

/** Count exact UTF-8 bytes; native RegExp scanning skips ASCII without a per-code-unit ArkTS loop. */
export function workspaceUtf8Bytes(value: string): number {
  let bytes: number = value.length;
  const nonAsciiRuns: RegExp = /[\u0080-\uFFFF]+/g;
  let match: RegExpExecArray | null = nonAsciiRuns.exec(value);
  while (match !== null) {
    const run: string = match[0];
    for (let index: number = 0; index < run.length; index++) {
      const code: number = run.charCodeAt(index);
      if (code < 0x800) { bytes++; } else {
        bytes += 2;
        // Both code units of a valid pair are non-ASCII, so a pair cannot straddle runs.
        if (code >= 0xD800 && code <= 0xDBFF && index + 1 < run.length &&
          run.charCodeAt(index + 1) >= 0xDC00 && run.charCodeAt(index + 1) <= 0xDFFF) {
          index++;
        }
      }
    }
    match = nonAsciiRuns.exec(value);
  }
  return bytes;
}

export function validTrashToken(value: string, sequence: number): boolean {
  if (!/^trash-[1-9][0-9]*$/.test(value)) { return false; }
  const token: number = Number(value.substring(6));
  return Number.isSafeInteger(token) && token > 0 && token <= sequence;
}
