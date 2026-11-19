/*
 * Copyright (c) 2022-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { photoAccessHelper } from '@kit.MediaLibraryKit';
import { fileIo } from '@kit.CoreFileKit';
import dataSharePredicates from '@ohos.data.dataSharePredicates';
import DateTimeUtil from '../model/DateTimeUtil';
import Logger from '../model/Logger';
import type common from '@ohos.app.ability.common';

export enum FileType {
  IMAGE = 1,
  VIDEO = 2,
  AUDIO = 3,
  FILE = 4
}

export interface AlbumInfo {
  albumName: string;
  count: number;
  mediaType: number;
}

export interface FileInfo {
  uri: string;
  fileName: string;
  mtime: number;
}

export interface MediaTypeInfo {
  prefix: string;
  suffix: string;
}

export type MediaPredicatesFactory = () => dataSharePredicates.DataSharePredicates;

export interface MediaClock {
  getDate(): string;
  getTime(): string;
}

export interface MediaFileStat {
  mtime: number;
}

export interface MediaFileOperations {
  openSync(path: string, mode: number): fileIo.File;
  closeSync(fd: number): void;
  renameSync(source: string, target: string): void;
  listFileSync(path: string): string[];
  statSync(path: string): MediaFileStat;
  unlinkSync(path: string): void;
}

export interface MediaPhotoAsset {
  uri: string;
  photoType: photoAccessHelper.PhotoType;
  get(member: string): photoAccessHelper.MemberType;
  set(member: string, value: string): void;
  commitModify(): Promise<void>;
}

export interface MediaFetchResult {
  getAllObjects(): Promise<MediaPhotoAsset[]>;
  close(): void;
}

export interface MediaLibraryOperations {
  createAsset(photoType: photoAccessHelper.PhotoType, extension: string): Promise<string>;
  getAssets(options: photoAccessHelper.FetchOptions): Promise<MediaFetchResult>;
  deleteAssets(context: common.UIAbilityContext, uris: string[]): Promise<void>;
}

class NativeFileOperations implements MediaFileOperations {
  openSync(path: string, mode: number): fileIo.File {
    return fileIo.openSync(path, mode);
  }

  closeSync(fd: number): void {
    fileIo.closeSync(fd);
  }

  renameSync(source: string, target: string): void {
    fileIo.renameSync(source, target);
  }

  listFileSync(path: string): string[] {
    return fileIo.listFileSync(path);
  }

  statSync(path: string): MediaFileStat {
    return fileIo.statSync(path);
  }

  unlinkSync(path: string): void {
    fileIo.unlinkSync(path);
  }
}

class NativeLibraryOperations implements MediaLibraryOperations {
  private helper: photoAccessHelper.PhotoAccessHelper;

  constructor(context: common.Context) {
    this.helper = photoAccessHelper.getPhotoAccessHelper(context);
  }

  async createAsset(photoType: photoAccessHelper.PhotoType, extension: string): Promise<string> {
    return this.helper.createAsset(photoType, extension);
  }

  async getAssets(options: photoAccessHelper.FetchOptions): Promise<MediaFetchResult> {
    return this.helper.getAssets(options);
  }

  async deleteAssets(context: common.UIAbilityContext, uris: string[]): Promise<void> {
    await photoAccessHelper.MediaAssetChangeRequest.deleteAssets(context, uris);
  }
}

/**
 * Unified asset handle shaped like the legacy FileAsset so callers keep
 * working against both media-library assets and sandbox files.
 */
export interface MediaAssetHandle {
  uri: string;
  mediaType: number;
  displayName: string;
  open(mode: string): Promise<number>;
  close(fd: number): Promise<void>;
  set(member: string, value: string): void;
  commitModify(): Promise<void>;
  get(member: string): photoAccessHelper.MemberType;
  rename(displayName: string): Promise<void>;
}

class PhotoAssetHandle implements MediaAssetHandle {
  uri: string;
  mediaType: number;
  displayName: string;
  private asset: MediaPhotoAsset;
  private files: MediaFileOperations;

  constructor(asset: MediaPhotoAsset, mediaType: number, files: MediaFileOperations) {
    this.asset = asset;
    this.files = files;
    this.uri = asset.uri;
    this.mediaType = mediaType;
    this.displayName = `${asset.get(photoAccessHelper.PhotoKeys.DISPLAY_NAME)}`;
  }

  async open(mode: string): Promise<number> {
    return this.files.openSync(this.uri, fileIo.OpenMode.READ_WRITE).fd;
  }

  async close(fd: number): Promise<void> {
    this.files.closeSync(fd);
  }

  set(member: string, value: string): void {
    this.asset.set(member, value);
  }

  async commitModify(): Promise<void> {
    await this.asset.commitModify();
  }

  get(member: string): photoAccessHelper.MemberType {
    return this.asset.get(member);
  }

  async rename(displayName: string): Promise<void> {
    this.asset.set(photoAccessHelper.PhotoKeys.DISPLAY_NAME, displayName);
    await this.asset.commitModify();
    this.displayName = `${this.asset.get(photoAccessHelper.PhotoKeys.DISPLAY_NAME)}`;
  }
}

class SandboxFileHandle implements MediaAssetHandle {
  uri: string;
  mediaType: number;
  displayName: string;
  private files: MediaFileOperations;

  constructor(uri: string, mediaType: number, files: MediaFileOperations) {
    this.uri = uri;
    this.mediaType = mediaType;
    this.files = files;
    this.displayName = uri.substring(uri.lastIndexOf('/') + 1);
  }

  async open(mode: string): Promise<number> {
    return this.files.openSync(this.uri, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE).fd;
  }

  async close(fd: number): Promise<void> {
    this.files.closeSync(fd);
  }

  set(member: string, value: string): void {
  }

  async commitModify(): Promise<void> {
  }

  get(member: string): photoAccessHelper.MemberType {
    return 0;
  }

  async rename(displayName: string): Promise<void> {
    if (displayName.length === 0 || displayName === '.' || displayName === '..' ||
      /[/\\\u0000-\u001f\u007f-\u009f]/.test(displayName)) {
      throw new Error('Invalid sandbox display name');
    }
    const dir = this.uri.substring(0, this.uri.lastIndexOf('/') + 1);
    const oldName = this.uri.substring(this.uri.lastIndexOf('/') + 1);
    const dot = oldName.lastIndexOf('.');
    const ext = dot > 0 ? oldName.substring(dot) : '';
    const newName = ext.length > 0 && !displayName.endsWith(ext) ? displayName + ext : displayName;
    const target = `${dir}${newName}`;
    this.files.renameSync(this.uri, target);
    this.uri = target;
    this.displayName = newName;
  }
}

export default class MediaUtils {
  private tag: string = 'MediaUtils';
  private mediaLibrary: MediaLibraryOperations;
  private files: MediaFileOperations;
  private clock: MediaClock;
  private predicatesFactory: MediaPredicatesFactory;
  private sandboxDirPath: string;
  private static instance: MediaUtils | undefined = undefined;

  public static getInstance(context: common.Context): MediaUtils {
    if (this.instance === undefined) {
      this.instance = new MediaUtils(context);
    }
    return this.instance;
  }

  constructor(context: common.Context, files?: MediaFileOperations,
    mediaLibrary?: MediaLibraryOperations, clock?: MediaClock,
    predicatesFactory: MediaPredicatesFactory = (): dataSharePredicates.DataSharePredicates =>
      new dataSharePredicates.DataSharePredicates()) {
    this.predicatesFactory = predicatesFactory;
    this.files = files === undefined ? new NativeFileOperations() : files;
    this.mediaLibrary = mediaLibrary === undefined ? new NativeLibraryOperations(context) : mediaLibrary;
    this.clock = clock === undefined ? new DateTimeUtil() : clock;
    this.sandboxDirPath = context.filesDir;
  }

  private validateCreateType(mediaType: number): void {
    if (mediaType !== FileType.IMAGE && mediaType !== FileType.VIDEO &&
      mediaType !== FileType.AUDIO && mediaType !== FileType.FILE) {
      throw new Error(`Unsupported create media type: ${mediaType}`);
    }
  }

  async createAndGetUri(mediaType: number): Promise<MediaAssetHandle> {
    this.validateCreateType(mediaType);
    const info = this.getInfoFromType(mediaType);
    const name = `${this.clock.getDate()}_${this.clock.getTime()}`;
    const displayName = `${info.prefix}${name}${info.suffix}`;
    Logger.info(this.tag, `displayName = ${displayName},mediaType = ${mediaType}`);
    // Audio and text records stay in the application sandbox; photos and videos use the media library.
    if (mediaType === FileType.AUDIO || mediaType === FileType.FILE) {
      return new SandboxFileHandle(`${this.sandboxDirPath}/${displayName}`, mediaType, this.files);
    }
    const photoType = mediaType === FileType.IMAGE ? photoAccessHelper.PhotoType.IMAGE :
      photoAccessHelper.PhotoType.VIDEO;
    const uri = await this.mediaLibrary.createAsset(photoType, info.suffix.substring(1));
    return new PhotoAssetHandle(await this.getAssetByUri(uri), mediaType, this.files);
  }

  private async getAssetByUri(uri: string): Promise<MediaPhotoAsset> {
    const predicates = this.predicatesFactory();
    predicates.equalTo(photoAccessHelper.PhotoKeys.URI, uri);
    const result = await this.mediaLibrary.getAssets({ fetchColumns: ['duration', 'date_added'], predicates });
    let assets: MediaPhotoAsset[];
    try {
      assets = await result.getAllObjects();
      if (assets.length === 0) {
        throw new Error(`Media asset not found: ${uri}`);
      }
    } finally {
      result.close();
    }
    return assets[0];
  }

  async getFdPath(fileAsset: MediaAssetHandle): Promise<number> {
    const fd = await fileAsset.open('Rw');
    Logger.info(this.tag, `fd = ${fd}`);
    return fd;
  }

  async createFile(mediaType: number, context: common.UIAbilityContext): Promise<fileIo.File | null> {
    this.validateCreateType(mediaType);
    const info = this.getInfoFromType(mediaType);
    const name = `${this.clock.getDate()}_${this.clock.getTime()}`;
    const displayName = `${info.prefix}${name}${info.suffix}`;
    Logger.info(this.tag, `displayName = ${displayName},mediaType = ${mediaType}`);
    Logger.info(this.tag, `filePath = ${context.filesDir}`);
    try {
      const file = this.files.openSync(context.filesDir + '/' + displayName,
        fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE);
      Logger.info(this.tag, `openFile success, fd = ${file.fd}`);
      return file;
    } catch (err) {
      Logger.error(this.tag, 'createFile failed, err:' + JSON.stringify(err));
    }
    return null;
  }

  async getFileAssetsFromType(mediaType: number): Promise<MediaAssetHandle[]> {
    Logger.info(this.tag, `getFileAssetsFromType,mediaType = ${mediaType}`);
    const fileAssets: MediaAssetHandle[] = [];
    try {
      if (mediaType === FileType.AUDIO || mediaType === FileType.FILE) {
        this.collectSandboxAssets(mediaType, fileAssets);
      } else {
        await this.collectLibraryAssets(mediaType, fileAssets);
      }
    } catch (err) {
      Logger.info(this.tag, `err ${JSON.stringify(err)}`);
    }
    Logger.info(this.tag, `getFileAssetsFromType = ${mediaType},fileAssets.count = ${fileAssets.length}`);
    return fileAssets;
  }

  private collectSandboxAssets(mediaType: number, fileAssets: MediaAssetHandle[]): void {
    const names = this.files.listFileSync(this.sandboxDirPath);
    names.filter(name => name.endsWith(mediaType === FileType.AUDIO ? '.mp3' : '.txt')).forEach(name => {
      fileAssets.push(new SandboxFileHandle(`${this.sandboxDirPath}/${name}`, mediaType, this.files));
    });
  }

  private async collectLibraryAssets(mediaType: number, fileAssets: MediaAssetHandle[]): Promise<void> {
    const predicates = this.predicatesFactory();
    const fetchOptions: photoAccessHelper.FetchOptions = {
      fetchColumns: ['duration', 'date_added'],
      predicates: predicates
    };
    const fetchResult = await this.mediaLibrary.getAssets(fetchOptions);
    try {
      const assets = await fetchResult.getAllObjects();
      assets.filter(item => item.photoType === mediaType).forEach(item => {
        fileAssets.push(new PhotoAssetHandle(item, mediaType, this.files));
      });
    } finally {
      fetchResult.close();
    }
  }

  async getFileAssets(context: common.Context, mediaType?: number): Promise<FileInfo[]> {
    const pathDir = this.sandboxDirPath;
    const fileInfos: FileInfo[] = [];
    try {
      const names = this.files.listFileSync(pathDir);
      const suffix = mediaType === undefined ? '' : this.getInfoFromType(mediaType).suffix;
      names.filter(name => suffix === '' || name.endsWith(suffix)).forEach((fileName: string) => {
        const fileStat = this.files.statSync(pathDir + '/' + fileName);
        fileInfos.push({
          uri: pathDir + '/' + fileName,
          fileName: fileName,
          mtime: fileStat.mtime
        });
      });
    } catch (error) {
      Logger.info(this.tag, 'getRoots failed, err:' + JSON.stringify(error));
    }
    return fileInfos;
  }

  async getAlbums(context: common.Context): Promise<AlbumInfo[]> {
    Logger.info(this.tag, 'getAlbums begin');
    const [images, videos, audios, fileInfos] = await Promise.all([
      this.getFileAssetsFromType(FileType.IMAGE),
      this.getFileAssetsFromType(FileType.VIDEO),
      this.getFileAssetsFromType(FileType.AUDIO),
      this.getFileAssets(context, FileType.FILE)
    ]);
    return [
      { albumName: 'Documents', count: fileInfos.length, mediaType: FileType.FILE },
      { albumName: 'Pictures', count: images.length, mediaType: FileType.IMAGE },
      { albumName: 'Videos', count: videos.length, mediaType: FileType.VIDEO },
      { albumName: 'Audios', count: audios.length, mediaType: FileType.AUDIO }
    ];
  }

  async deleteFile(mediaType: number, uri: string, context?: common.UIAbilityContext): Promise<void> {
    if (mediaType === FileType.AUDIO || mediaType === FileType.FILE) {
      try {
        this.files.unlinkSync(uri);
      } catch (err) {
        Logger.info(this.tag, `delete failed, err: ${err}`);
      }
      return;
    }
    if (context !== undefined) {
      try {
        await this.mediaLibrary.deleteAssets(context, [uri]);
      } catch (err) {
        Logger.info(this.tag, `delete failed, err: ${err}`);
      }
    } else {
      Logger.info(this.tag, 'delete skipped, no context for media asset');
    }
  }

  getInfoFromType(mediaType: number): MediaTypeInfo {
    switch (mediaType) {
      case FileType.IMAGE:
        return { prefix: 'IMG_', suffix: '.jpg' };
      case FileType.VIDEO:
        return { prefix: 'VID_', suffix: '.mp4' };
      case FileType.AUDIO:
        return { prefix: 'AUD_', suffix: '.mp3' };
      default:
        return { prefix: 'FILE_', suffix: '.txt' };
    }
  }
}
