export interface PageProbe {
  /** Only operation/syscall success. It does not prove that residency is observable. */
  ok: boolean;
  /** Conservative owner/effective-write-open eligibility, NOT the exact kernel gate.
   * Quantitative use additionally requires successful same-run private-file calibration. */
  residencyTrusted: boolean;
  residencyTrustReason: string;
  operation: string;
  errorCode: number;
  message: string;
  fileBytes: number;
  pageBytes: number;
  totalPages: number;
  /** Raw mincore count, retained even if untrusted. */
  residentPages: number;
  /** Legacy name: file CONTENT bytes covered by raw resident pages, not physical bytes. */
  residentBytes: number;
  residentContentBytes: number;
  residentBytesMeaning: string;
  bytesRead: number;
  checksum: number;
  /** Legacy device:inode decimal composite. */
  inode: string;
  deviceId: string;
  deviceMajor: number;
  deviceMinor: number;
  inodeNumber: string;
  /** Lowercase hex, for trace filemap ino correlation without JS precision loss. */
  inodeHex: string;
  fileOwnerUid: number;
  /** Legacy field: effective UID. */
  processUid: number;
  realUid: number;
  ownsFile: boolean;
  writeOpenAllowed: boolean;
  writeOpenErrno: number;
  /** Compatibility field, now derived from owner or actual effective write OPEN. */
  ownerOrWritable: boolean;
  sampleStartedMonotonicMs: number;
  sampleCompletedMonotonicMs: number;
  sampleWallTimeMs: number;
  kernelName: string;
  kernelRelease: string;
}

export interface PageCalibration {
  ok: boolean;
  /** Observed cold->warm response on this private inode only; never proves HAP observability. */
  passed: boolean;
  path: string;
  phase: string;
  errorCode: number;
  message: string;
  bytesWritten: number;
  fsyncReturnCode: number;
  /** posix_fadvise returns its error code directly. */
  fadviseReturnCode: number;
  removed: boolean;
  cleanupErrorCode: number;
  afterWrite: PageProbe;
  afterDrop: PageProbe;
  afterRead: PageProbe;
}

/** Reads all bytes of an existing installed file; never writes or evicts. */
export const warmFile: (path: string) => PageProbe;
/** mincore on a temporary PROT_NONE mapping: does not access/fault file data. */
export const sampleFile: (path: string) => PageProbe;
/** Creates a NEW 0600 file in an app-owned private directory, fsync/fadvise ONLY that
 * new fd, samples cold/warm response, then removes only that same created inode. */
export const calibratePrivateFile: (directory: string) => PageCalibration;

export interface MappedProbe {
  ok: boolean;
  handle: number;
  errorCode: number;
  message: string;
  mappedBytes: number;
  virtualStart: string;
  virtualEnd: string;
  fdPath: string;
  fdPathErrorCode: number;
  bytesTouched: number;
  checksum: number;
  faultScope: string;
  faultCountersAvailable: boolean;
  minorFaults: number | null;
  majorFaults: number | null;
  pagemapReadable: boolean;
  /** Baseline fully touched mapping was independently seen PRESENT in self/pagemap. */
  pagemapEstablished: boolean;
  pagemapErrorCode: number;
  pagemapMeaning: string;
  rawPresentPages: number | null;
  /** This precise mapping's PRESENT PTE count, NOT global file-cache residency. */
  presentPages: number | null;
  /** Old raw mincore signal retained separately. */
  file: PageProbe;
}
/** Holds PROT_READ MAP_PRIVATE until explicit release; checksum touches all file bytes. */
export const beginMappedFile: (path: string) => MappedProbe;
/** Passive self/pagemap PRESENT scan; does not read target mapping data. */
export const sampleMappedFile: (handle: number) => MappedProbe;
/** Only AFTER SDK/window: full mapped-byte checksum plus narrowly bracketed getrusage faults. */
export const rereadMappedFile: (handle: number) => MappedProbe;
export const releaseMappedFile: (handle: number) => boolean;
