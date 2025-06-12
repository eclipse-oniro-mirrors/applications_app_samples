/**
 *
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 *
 * All rights reserved.
 * Redistribution and use in source and binary forms, with or without modification,
 * are permitted provided that the following conditions are met:
 *
 * Redistributions of source code must retain the above copyright notice,this
 * list of conditions and the following disclaimer.
 *
 * Redistributions in binary form must reproduce the above copyright notice,
 * this list of conditions and the following disclaimer in the documentation
 * and/or other materials provided with the distribution.
 *
 * THIS IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS 'AS IS' AND ANY EXPRESS OR IMPLIED WARRANTIES,
 * INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
 * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
 * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
 * OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
 * STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS,
 *
 * EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

let nextID: number = 1;

export class downloadFilesData {
  // 唯一标识
  id: string;
  // 下载地址
  url: string;
  // 文件下载状态： 0未下载， 1下载成功， 2下载失败, 3已删除
  fileStatus: number;
  // 下载完成的时间戳
  downloadTime: number;

  constructor(
    url: string = '',
    fileStatus: number = 0,
    downloadTime: number = 0,
  ) {
    this.id = String(nextID++);
    this.url = url;
    this.fileStatus = fileStatus;
    this.downloadTime = downloadTime;
  }
}