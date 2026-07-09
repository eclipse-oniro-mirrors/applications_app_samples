export const initPlayer: () => void;

export const loadPcmInfo: (pcmFd: number, pcmFileSize: number, pcmDuration: number, pcmFileOffset: number) => void;

export const playPcm: () => void;

export const pausePcm: () => void;

export const stopPcm: () => void;

export const releasePlayer: () => void;

export const onPlayStatus: (cbFn: (state: number) => void) => void;
