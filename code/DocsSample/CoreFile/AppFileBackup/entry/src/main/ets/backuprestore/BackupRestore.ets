/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

// [Start get_local_cap_ability]
// [Start session_backup]
// [Start session_restore]
import { fileIo, backup } from '@kit.CoreFileKit';
import type { BusinessError } from '@kit.BasicServicesKit';
// [StartExclude session_restore]
// [StartExclude session_backup]
// [StartExclude get_local_cap_ability]
import type { ReadOptions } from '@kit.CoreFileKit';
import { buffer } from '@kit.ArkTS';
import { storeBackupFile, restoreBackupFile } from './BackupFileTransfer';

const BUFFER: number = 1024; // 读写文件的缓冲区
// [EndExclude get_local_cap_ability]
// [EndExclude session_backup]
// [EndExclude session_restore]

// filesDir由调用方通过UIAbilityContext.filesDir获取并传入。

// [StartExclude session_backup]
// [StartExclude session_restore]
// 获取能力文件
/** Copies and reads capabilities while releasing both owned descriptors. */
export async function getLocalCapabilities(filesDir: string): Promise<void> {
  try {
    const fileData: backup.FileData = await backup.getLocalCapabilities();
    console.info('getLocalCapabilities success');
    const fpath: string = `${filesDir}/localCapabilities.json`;
    try {
      fileIo.copyFileSync(fileData.fd, fpath);
    } finally {
      fileIo.closeSync(fileData.fd);
    }
    // [StartExclude get_local_cap_ability]
    const file: fileIo.File = fileIo.openSync(fpath, fileIo.OpenMode.READ_WRITE);
    try {
      // 从文件中读取一段内容
      const arrayBuffer: ArrayBuffer = new ArrayBuffer(BUFFER);
      const readOptions: ReadOptions = {
        offset: 0, // 从文件的开头开始读取
        length: arrayBuffer.byteLength
      };
      const readLen: number = fileIo.readSync(file.fd, arrayBuffer, readOptions);
      // 这个buf对象是arrayBuffer中从位置0开始的前readLen字节
      const buf: buffer.Buffer = buffer.from(arrayBuffer, 0, readLen);
      console.info(`Capability file read successful, bytes=${buf.length}`);
    } finally {
      fileIo.closeSync(file.fd);
    }
    // [EndExclude get_local_cap_ability]
  } catch (error) {
    console.error(`getLocalCapabilities failed with err, code is ${error.code}, message is ${error.message}`);
  }
}
// [End get_local_cap_ability]
// [EndExclude session_backup]

// 应用备份数据
// 创建SessionBackup类的实例用于备份数据
let gSession: backup.SessionBackup;

function createSessionBackup(filesDir: string): backup.SessionBackup {
  const generalCallbacks: backup.GeneralCallbacks = {
    // onFileReady为服务回调给应用侧数据完成的通知，建议开发者在该接口内不要进行过多的耗时实现，可以通过异步线程实现file.fd数据的处理
    onFileReady: (err: BusinessError, file: backup.File): void => {
      if (err) {
        console.error(`onFileReady err, code is ${err.code}, message is ${err.message}`);
        return;
      }
      try {
        storeBackupFile(filesDir, { fd: file.fd, bundleName: file.bundleName, uri: file.uri });
        console.info('onFileReady success');
      } catch (error) {
        const err: BusinessError = error as BusinessError;
        console.error(`onFileReady failed. Code: ${err.code}, message: ${err.message}`);
      }
    },
    onBundleBegin: (err: BusinessError<string | void>, bundleName: string): void => {
      if (err) {
        console.error(`onBundleBegin err, code is ${err.code}, message is ${err.message}`);
      } else {
        console.info('onBundleBegin bundleName: ' + bundleName);
      }
    },
    onBundleEnd: (err: BusinessError<string | void>, bundleName: string): void => {
      if (err) {
        console.error(`onBundleEnd err, code is ${err.code}, message is ${err.message}`);
      } else {
        console.info('onBundleEnd bundleName: ' + bundleName);
      }
    },
    onAllBundlesEnd: (err: BusinessError): void => {
      if (err) {
        console.error(`onAllBundlesEnd err, code is ${err.code}, message is ${err.message}`);
      } else {
        console.info('onAllBundlesEnd');
      }
    },
    onBackupServiceDied: (): void => {
      console.info('onBackupServiceDied');
    },
    onResultReport: (bundleName: string, result: string): void => {
      console.info('onResultReport  bundleName: ' + bundleName);
      console.info('onResultReport  result: ' + result);
    },
    onProcess: (bundleName: string, process: string): void => {
      console.info('onProcess bundleName: ' + bundleName);
      console.info('onProcess result: ' + process);
    }
  };
  const sessionBackup: backup.SessionBackup = new backup.SessionBackup(generalCallbacks);
  return sessionBackup;
}

// [StartExclude session_backup]
/** Releases the active backup session without deleting archived files. */
export async function release(): Promise<void> {
  try {
    await gSession.release();
    console.info('release success');
  } catch (error) {
    const err: BusinessError = error as BusinessError;
    console.error(`release err, code is ${err.code}, message is ${err.message}`);
  }
}
// [EndExclude session_backup]
/** Starts the system backup session for the configured application. */
export async function sessionBackup(filesDir: string): Promise<void> {
  gSession = createSessionBackup(filesDir);
  // 此处可根据backup.getLocalCapabilities()提供的能力文件，选择需要备份的应用
  // 也可直接根据应用包名称进行备份
  const backupApps: string[] = [
    'com.samples.filebackupextension',
  ];
  await gSession.appendBundles(backupApps);
  console.info('appendBundles success');
}
// [End session_backup]
// [EndExclude session_restore]
// 应用数据恢复
// 创建SessionRestore类的实例用于恢复数据
let gSessionRestore: backup.SessionRestore;
const initMap: Map<string, number> = new Map<string, number>();
const testFileNum: number = 2; // 初始化文件个数
const testBundleName: string = 'com.samples.filebackupextension'; // 测试包名
initMap.set(testBundleName, testFileNum);
const countMap: Map<string, number> = new Map<string, number>();
countMap.set(testBundleName, 0); // 初始化计数

async function publishFile(file: backup.File): Promise<void> {
  console.info('start publishFile');
  const fileMeta: backup.FileMeta = {
    bundleName: file.bundleName,
    uri: ''
  };
  await gSessionRestore.publishFile(fileMeta);
}

function createSessionRestore(filesDir: string): backup.SessionRestore {
  const generalCallbacks: backup.GeneralCallbacks = {
    onFileReady: (err: BusinessError, file: backup.File): void => {
      if (err) {
        console.error(`onFileReady err, code is ${err.code}, message is ${err.message}`);
        return;
      }
      try {
        restoreBackupFile(filesDir, { fd: file.fd, bundleName: file.bundleName, uri: file.uri });
      } catch (error) {
        console.error(`Restore file transfer failed. Code: ${(error as BusinessError).code}`);
        return;
      }
      let currentCount: number = countMap.get(file.bundleName) || 0; // 如果没有找到对应的计数，则默认返回 0
      countMap.set(file.bundleName, ++currentCount);
      // 恢复数据传输完成后，会通知服务端文件准备就绪
      if (countMap.get(file.bundleName) == initMap.get(file.bundleName)) { // 每个包的所有文件收到后触发publishFile
        publishFile(file);
      }
      console.info('onFileReady success');
    },
    onBundleBegin: (err: BusinessError<string | void>, bundleName: string): void => {
      if (err) {
        console.error(`onBundleBegin failed with err, code is ${err.code}, message is ${err.message}`);
      }
      console.info('onBundleBegin success');
    },
    onBundleEnd: (err: BusinessError<string | void>, bundleName: string): void => {
      if (err) {
        console.error(`onBundleEnd failed with err, code is ${err.code}, message is ${err.message}`);
      }
      console.info('onBundleEnd success');
    },
    onAllBundlesEnd: (err: BusinessError): void => {
      if (err) {
        console.error(`onAllBundlesEnd failed with err, code is ${err.code}, message is ${err.message}`);
      }
      console.info('onAllBundlesEnd success');
    },
    onBackupServiceDied: (): void => {
      console.info('service died');
    },
    onResultReport: (bundleName: string, result: string): void => {
      console.info('onResultReport  bundleName: ' + bundleName);
      console.info('onResultReport  result: ' + result);
    },
    onProcess: (bundleName: string, process: string): void => {
      console.info('onProcess bundleName: ' + bundleName);
      console.info('onProcess result: ' + process);
    }
  };
  const sessionRestore: backup.SessionRestore = new backup.SessionRestore(generalCallbacks);
  return sessionRestore;
}

/** Requests the configured archive descriptors from the system restore session. */
export async function sessionRestore(filesDir: string): Promise<void> {
  gSessionRestore = createSessionRestore(filesDir);
  const restoreApps: string[] = [
    'com.samples.filebackupextension'
  ];
  // 能力文件的获取方式可以根据开发者实际场景进行调整。此处仅为请求示例
  // 开发者也可以根据能力文件内容的结构示例，自行构造能力文件内容
  const fileDat: backup.FileData = await backup.getLocalCapabilities();
  await gSessionRestore.appendBundles(fileDat.fd, restoreApps);
  console.info('appendBundles success');
  // 添加需要恢复的应用成功后，请根据需要恢复的应用名称，调用getFileHandle接口获取待恢复应用数据文件的文件句柄
  // 应用待恢复数据文件数请依据实际备份文件个数为准，此处仅为请求示例
  const handle: backup.FileMeta = {
    bundleName: restoreApps[0],
    uri: 'manage.json'
  };
  await gSessionRestore.getFileHandle(handle);
  handle.uri = 'part.0.tar';
  await gSessionRestore.getFileHandle(handle);
  console.info('getFileHandle success');
}
// [End session_restore]
