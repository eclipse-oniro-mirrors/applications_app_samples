/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { pasteboard } from '@kit.BasicServicesKit';
import { common } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';

/** 日志域ID */
const DOMAIN: number = 0xFF00;
/** 日志标签 */
const TAG: string = 'ClipboardUtils';

/**
 * 剪贴板数据类型枚举
 * 定义剪贴板支持的数据类型
 */
export enum ClipboardDataType {
  /** 纯文本 */
  TEXT = 'text',
  /** URI链接 */
  URI = 'uri',
  /** HTML内容 */
  HTML = 'html',
  /** 无数据 */
  NONE = 'none'
}

/**
 * 剪贴板内容结构体
 * 用于存储和传递剪贴板数据
 */
export class ClipboardContent {
  /** 数据类型 */
  public type: ClipboardDataType = ClipboardDataType.NONE;
  /** 文本内容 */
  public text: string = '';
  /** URI内容 */
  public uri: string = '';
  /** HTML内容 */
  public html: string = '';
  /** 时间戳 */
  public timestamp: number = 0;
}

/**
 * 剪贴板工具类
 * 提供剪贴板的读写操作功能
 * 
 * @remarks
 * 该类为静态工具类，无需实例化
 * 支持文本、URI、HTML等多种数据类型的读写
 * 
 * @example
 * ```typescript
 * // 复制文本到剪贴板
 * await ClipboardUtils.copyText(context, 'Hello World');
 * 
 * // 从剪贴板粘贴文本
 * const text = await ClipboardUtils.pasteText(context);
 * 
 * // 检查剪贴板是否有内容
 * const hasContent = await ClipboardUtils.hasContent(context);
 * ```
 */
export class ClipboardUtils {
  /** 默认剪贴板名称 */
  public static readonly DEFAULT_CLIPBOARD_NAME: string = 'clipboard';

  /**
   * 获取系统剪贴板实例
   * 创建或获取系统剪贴板服务
   * 
   * @returns pasteboard.SystemPasteboard 剪贴板实例
   */
  private static getSystemPasteboard(): pasteboard.SystemPasteboard {
    // 记录方法调用日志
    hilog.debug(DOMAIN, TAG, 'getSystemPasteboard() called');
    // 获取系统剪贴板
    const pasteboardInstance: pasteboard.SystemPasteboard = pasteboard.getSystemPasteboard();
    hilog.info(DOMAIN, TAG, 'getSystemPasteboard() success');
    return pasteboardInstance;
  }

  /**
   * 复制文本到剪贴板
   * 将文本数据写入系统剪贴板
   * 
   * @param context - 应用上下文（此参数保留，实际不需要）
   * @param text - 要复制的文本内容
   * @returns Promise<boolean> 成功返回true，失败返回false
   */
  static async copyText(context: common.Context, text: string): Promise<boolean> {
    // 记录方法调用日志
    hilog.debug(DOMAIN, TAG, `copyText() called with text length: ${text.length}`);
    try {
      // 创建剪贴板数据
      const pasteData: pasteboard.PasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, text);
      // 获取剪贴板实例
      const systemPasteboard: pasteboard.SystemPasteboard = ClipboardUtils.getSystemPasteboard();
      // 写入剪贴板
      await systemPasteboard.setData(pasteData);
      hilog.info(DOMAIN, TAG, 'copyText() success');
      return true;
    } catch (error) {
      // 记录复制失败
      hilog.error(DOMAIN, TAG, `copyText() failed: ${(error as Error).message}`);
      return false;
    }
  }

  /**
   * 从剪贴板粘贴文本
   * 读取系统剪贴板中的文本内容
   * 
   * @param context - 应用上下文（此参数保留，实际不需要）
   * @returns Promise<string> 剪贴板中的文本内容，无内容返回空字符串
   */
  static async pasteText(context: common.Context): Promise<string> {
    // 记录方法调用日志
    hilog.debug(DOMAIN, TAG, 'pasteText() called');
    try {
      // 获取剪贴板实例
      const systemPasteboard: pasteboard.SystemPasteboard = ClipboardUtils.getSystemPasteboard();
      // 读取剪贴板数据
      const pasteData: pasteboard.PasteData = await systemPasteboard.getData();
      // 检查数据类型（使用getMimeTypes替代已废弃的getMimeType）
      const mimeTypes: string[] = pasteData.getMimeTypes();
      if (mimeTypes && mimeTypes.length > 0 && mimeTypes[0] === pasteboard.MIMETYPE_TEXT_PLAIN) {
        const text: string = pasteData.getPrimaryText();
        hilog.info(DOMAIN, TAG, `pasteText() got text length: ${text.length}`);
        return text;
      }
      hilog.warn(DOMAIN, TAG, 'pasteText() no text data in clipboard');
      return '';
    } catch (error) {
      // 记录粘贴失败
      hilog.error(DOMAIN, TAG, `pasteText() failed: ${(error as Error).message}`);
      return '';
    }
  }

  /**
   * 复制URI到剪贴板
   * 将URI链接写入系统剪贴板（以纯文本形式存储URI）
   * 
   * @param context - 应用上下文
   * @param uri - 要复制的URI
   * @returns Promise<boolean> 成功返回true，失败返回false
   */
  static async copyUri(context: common.Context, uri: string): Promise<boolean> {
    // 记录方法调用日志
    hilog.debug(DOMAIN, TAG, `copyUri() called with uri: ${uri}`);
    try {
      // 创建纯文本类型的剪贴板数据（存储URI）
      const pasteData: pasteboard.PasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, uri);
      // 获取剪贴板实例并写入
      const systemPasteboard: pasteboard.SystemPasteboard = ClipboardUtils.getSystemPasteboard();
      await systemPasteboard.setData(pasteData);
      hilog.info(DOMAIN, TAG, 'copyUri() success');
      return true;
    } catch (error) {
      // 记录复制失败
      hilog.error(DOMAIN, TAG, `copyUri() failed: ${(error as Error).message}`);
      return false;
    }
  }

  /**
   * 从剪贴板获取URI
   * 读取系统剪贴板中的URI内容
   * 
   * @param context - 应用上下文
   * @returns Promise<string> 剪贴板中的URI，无内容返回空字符串
   */
  static async getUri(context: common.Context): Promise<string> {
    // 记录方法调用日志
    hilog.debug(DOMAIN, TAG, 'getUri() called');
    try {
      // 获取剪贴板实例
      const systemPasteboard: pasteboard.SystemPasteboard = ClipboardUtils.getSystemPasteboard();
      // 读取剪贴板数据
      const pasteData: pasteboard.PasteData = await systemPasteboard.getData();
      // 获取URI
      const uri: string = pasteData.getPrimaryUri();
      hilog.info(DOMAIN, TAG, `getUri() result: ${uri || 'none'}`);
      return uri || '';
    } catch (error) {
      // 记录获取失败
      hilog.error(DOMAIN, TAG, `getUri() failed: ${(error as Error).message}`);
      return '';
    }
  }

  /**
   * 复制HTML到剪贴板
   * 将HTML内容写入系统剪贴板
   * 
   * @param context - 应用上下文
   * @param html - 要复制的HTML内容
   * @returns Promise<boolean> 成功返回true，失败返回false
   */
  static async copyHtml(context: common.Context, html: string): Promise<boolean> {
    // 记录方法调用日志
    hilog.debug(DOMAIN, TAG, `copyHtml() called with html length: ${html.length}`);
    try {
      // 创建HTML类型的剪贴板数据
      const pasteData: pasteboard.PasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_HTML, html);
      // 获取剪贴板实例并写入
      const systemPasteboard: pasteboard.SystemPasteboard = ClipboardUtils.getSystemPasteboard();
      await systemPasteboard.setData(pasteData);
      hilog.info(DOMAIN, TAG, 'copyHtml() success');
      return true;
    } catch (error) {
      // 记录复制失败
      hilog.error(DOMAIN, TAG, `copyHtml() failed: ${(error as Error).message}`);
      return false;
    }
  }

  /**
   * 从剪贴板获取HTML
   * 读取系统剪贴板中的HTML内容
   * 
   * @param context - 应用上下文
   * @returns Promise<string> 剪贴板中的HTML，无内容返回空字符串
   */
  static async getHtml(context: common.Context): Promise<string> {
    // 记录方法调用日志
    hilog.debug(DOMAIN, TAG, 'getHtml() called');
    try {
      // 获取剪贴板实例
      const systemPasteboard: pasteboard.SystemPasteboard = ClipboardUtils.getSystemPasteboard();
      // 读取剪贴板数据
      const pasteData: pasteboard.PasteData = await systemPasteboard.getData();
      // 获取HTML
      const html: string = pasteData.getPrimaryHtml();
      hilog.info(DOMAIN, TAG, `getHtml() result length: ${html.length}`);
      return html;
    } catch (error) {
      // 记录获取失败
      hilog.error(DOMAIN, TAG, `getHtml() failed: ${(error as Error).message}`);
      return '';
    }
  }

  /**
   * 检查剪贴板是否有内容
   * 判断系统剪贴板中是否存在数据
   * 
   * @param context - 应用上下文
   * @returns Promise<boolean> 有内容返回true，否则返回false
   */
  static async hasContent(context: common.Context): Promise<boolean> {
    // 记录方法调用日志
    hilog.debug(DOMAIN, TAG, 'hasContent() called');
    try {
      // 获取剪贴板实例
      const systemPasteboard: pasteboard.SystemPasteboard = ClipboardUtils.getSystemPasteboard();
      // 检查是否有数据
      const hasData: boolean = await systemPasteboard.hasData();
      hilog.info(DOMAIN, TAG, `hasContent() result: ${hasData}`);
      return hasData;
    } catch (error) {
      // 记录检查失败
      hilog.error(DOMAIN, TAG, `hasContent() failed: ${(error as Error).message}`);
      return false;
    }
  }

  /**
   * 获取剪贴板数据类型
   * 检查当前剪贴板中数据的类型
   * 
   * @param context - 应用上下文
   * @returns Promise<ClipboardDataType> 数据类型枚举值
   */
  static async getDataType(context: common.Context): Promise<ClipboardDataType> {
    // 记录方法调用日志
    hilog.debug(DOMAIN, TAG, 'getDataType() called');
    try {
      // 获取剪贴板实例
      const systemPasteboard: pasteboard.SystemPasteboard = ClipboardUtils.getSystemPasteboard();
      // 检查是否有数据
      const hasData: boolean = await systemPasteboard.hasData();
      if (!hasData) {
        hilog.info(DOMAIN, TAG, 'getDataType() result: NONE');
        return ClipboardDataType.NONE;
      }
      // 读取数据判断类型（使用getMimeTypes替代getMimeType）
      const pasteData: pasteboard.PasteData = await systemPasteboard.getData();
      const mimeTypes: string[] = pasteData.getMimeTypes();
      // 根据MIME类型判断
      let dataType: ClipboardDataType = ClipboardDataType.NONE;
      if (mimeTypes && mimeTypes.length > 0) {
        const mimeType: string = mimeTypes[0];
        if (mimeType === pasteboard.MIMETYPE_TEXT_PLAIN) {
          dataType = ClipboardDataType.TEXT;
        } else if (mimeType === pasteboard.MIMETYPE_TEXT_HTML) {
          dataType = ClipboardDataType.HTML;
        } else {
          dataType = ClipboardDataType.URI;
        }
      }
      hilog.info(DOMAIN, TAG, `getDataType() result: ${dataType}`);
      return dataType;
    } catch (error) {
      // 记录获取失败
      hilog.error(DOMAIN, TAG, `getDataType() failed: ${(error as Error).message}`);
      return ClipboardDataType.NONE;
    }
  }

  /**
   * 获取剪贴板完整内容
   * 读取剪贴板中的所有数据
   * 
   * @param context - 应用上下文
   * @returns Promise<ClipboardContent> 剪贴板内容结构体
   */
  static async getContent(context: common.Context): Promise<ClipboardContent> {
    // 记录方法调用日志
    hilog.debug(DOMAIN, TAG, 'getContent() called');
    try {
      // 获取剪贴板实例
      const systemPasteboard: pasteboard.SystemPasteboard = ClipboardUtils.getSystemPasteboard();
      // 读取数据
      const pasteData: pasteboard.PasteData = await systemPasteboard.getData();
      // 构建内容对象（使用class实例化替代对象字面量）
      const content: ClipboardContent = new ClipboardContent();
      content.type = ClipboardDataType.NONE;
      content.timestamp = Date.now();
      // 填充各类型数据（使用getMimeTypes替代getMimeType）
      const mimeTypes: string[] = pasteData.getMimeTypes();
      if (mimeTypes && mimeTypes.length > 0) {
        const mimeType: string = mimeTypes[0];
        if (mimeType === pasteboard.MIMETYPE_TEXT_PLAIN) {
          content.type = ClipboardDataType.TEXT;
          content.text = pasteData.getPrimaryText();
        } else if (mimeType === pasteboard.MIMETYPE_TEXT_HTML) {
          content.type = ClipboardDataType.HTML;
          content.html = pasteData.getPrimaryHtml();
        }
      }
      const uri: string = pasteData.getPrimaryUri();
      if (uri) {
        content.type = ClipboardDataType.URI;
        content.uri = uri;
      }
      hilog.info(DOMAIN, TAG, `getContent() result type: ${content.type}`);
      return content;
    } catch (error) {
      // 记录获取失败
      hilog.error(DOMAIN, TAG, `getContent() failed: ${(error as Error).message}`);
      const defaultContent: ClipboardContent = new ClipboardContent();
      defaultContent.type = ClipboardDataType.NONE;
      defaultContent.timestamp = Date.now();
      return defaultContent;
    }
  }

  /**
   * 清空剪贴板
   * 通过写入空数据来清空系统剪贴板
   * 
   * @param context - 应用上下文
   * @returns Promise<boolean> 成功返回true，失败返回false
   */
  static async clear(context: common.Context): Promise<boolean> {
    // 记录方法调用日志
    hilog.debug(DOMAIN, TAG, 'clear() called');
    try {
      // 获取剪贴板实例
      const systemPasteboard: pasteboard.SystemPasteboard = ClipboardUtils.getSystemPasteboard();
      // 通过写入空数据来清空剪贴板（替代已废弃的clear方法）
      const emptyData: pasteboard.PasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, '');
      await systemPasteboard.setData(emptyData);
      hilog.info(DOMAIN, TAG, 'clear() success');
      return true;
    } catch (error) {
      // 记录清空失败
      hilog.error(DOMAIN, TAG, `clear() failed: ${(error as Error).message}`);
      return false;
    }
  }

  /**
   * 监听剪贴板变化
   * 注册剪贴板内容变化的监听器
   * 
   * @param callback - 剪贴板变化回调函数
   * @returns Promise<boolean> 注册成功返回true，失败返回false
   */
  static async onClipboardChange(callback: () => void): Promise<boolean> {
    // 记录方法调用日志
    hilog.debug(DOMAIN, TAG, 'onClipboardChange() called');
    try {
      // 获取剪贴板实例
      const systemPasteboard: pasteboard.SystemPasteboard = ClipboardUtils.getSystemPasteboard();
      // 注册监听（使用'update'事件替代'clipboardChanged'）
      systemPasteboard.on('update', callback);
      hilog.info(DOMAIN, TAG, 'onClipboardChange() registered');
      return true;
    } catch (error) {
      // 记录注册失败
      hilog.error(DOMAIN, TAG, `onClipboardChange() failed: ${(error as Error).message}`);
      return false;
    }
  }

  /**
   * 取消监听剪贴板变化
   * 注销剪贴板内容变化的监听器
   * 
   * @param callback - 要注销的回调函数
   * @returns Promise<boolean> 注销成功返回true，失败返回false
   */
  static async offClipboardChange(callback: () => void): Promise<boolean> {
    // 记录方法调用日志
    hilog.debug(DOMAIN, TAG, 'offClipboardChange() called');
    try {
      // 获取剪贴板实例
      const systemPasteboard: pasteboard.SystemPasteboard = ClipboardUtils.getSystemPasteboard();
      // 注销监听（使用'update'事件替代'clipboardChanged'）
      systemPasteboard.off('update', callback);
      hilog.info(DOMAIN, TAG, 'offClipboardChange() unregistered');
      return true;
    } catch (error) {
      // 记录注销失败
      hilog.error(DOMAIN, TAG, `offClipboardChange() failed: ${(error as Error).message}`);
      return false;
    }
  }
}
