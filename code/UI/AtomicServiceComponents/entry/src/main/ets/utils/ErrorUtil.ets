export class ErrorInfo {
  code: number;
  message: string;
  hint: string;

  constructor(code: number, message: string, hint: string) {
    this.code = code;
    this.message = message.length > 0 ? message : '未知错误';
    this.hint = hint;
  }

  describe(): string {
    if (this.code > 0) {
      return `[${this.code}] ${this.message}`;
    }
    return this.message;
  }
}

export function errorInfo(code: number, message: string): ErrorInfo {
  return new ErrorInfo(code, message, pickerErrorHint(code));
}

export function formatError(action: string, code: number, message: string): string {
  const detail = message.length > 0 ? message : '未知错误';
  if (code > 0) {
    return `${action}失败（${code}）：${detail}`;
  }
  return `${action}失败：${detail}`;
}

export function pickerErrorHint(code: number): string {
  switch (code) {
    case 13900001:
      return '操作不允许，可能缺少用户授权';
    case 13900002:
      return '目标文件或目录不存在';
    case 13900012:
      return '权限被拒绝，请检查可见性配置';
    case 13900015:
      return '目标文件已存在';
    case 13900020:
      return '参数无效，请检查保存选项';
    case 13900042:
      return '文件服务暂不可用，可稍后重试';
    default:
      return '选择器不可用时将降级写入应用沙箱';
  }
}
