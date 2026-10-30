export function pad2(value: number): string {
  return value < 10 ? `0${value}` : `${value}`;
}

export function formatTime(date: Date): string {
  return `${pad2(date.getHours())}:${pad2(date.getMinutes())}:${pad2(date.getSeconds())}`;
}

export function formatDateTime(date: Date): string {
  const year = date.getFullYear();
  const month = pad2(date.getMonth() + 1);
  const day = pad2(date.getDate());
  return `${year}-${month}-${day} ${formatTime(date)}`;
}

export function formatDuration(ms: number): string {
  if (ms < 0) {
    return '0 ms';
  }
  if (ms < 1000) {
    return `${ms} ms`;
  }
  if (ms < 60000) {
    return `${(ms / 1000).toFixed(1)} s`;
  }
  const minutes = Math.floor(ms / 60000);
  const seconds = Math.floor((ms % 60000) / 1000);
  return `${minutes} min ${seconds} s`;
}

export function formatBytes(bytes: number): string {
  if (bytes < 1024) {
    return `${bytes} B`;
  }
  if (bytes < 1024 * 1024) {
    return `${(bytes / 1024).toFixed(1)} KB`;
  }
  return `${(bytes / (1024 * 1024)).toFixed(1)} MB`;
}

export function formatPercent(value: number, total: number): string {
  if (total <= 0) {
    return '0%';
  }
  const percent = Math.max(0, Math.min(100, Math.round(value * 100 / total)));
  return `${percent}%`;
}

export function progressBucket(progress: number): number {
  if (!(progress > 0)) {
    return 0;
  }
  return Math.min(4, Math.floor(progress / 25));
}

export function truncateMiddle(text: string, maxLength: number): string {
  if (maxLength <= 3 || text.length <= maxLength) {
    return text;
  }
  const keep = maxLength - 1;
  const head = Math.ceil(keep / 2);
  const tail = keep - head;
  return `${text.slice(0, head)}…${text.slice(text.length - tail)}`;
}

export function buildDownloadFileName(date: Date): string {
  const year = date.getFullYear();
  const month = pad2(date.getMonth() + 1);
  const day = pad2(date.getDate());
  const hours = pad2(date.getHours());
  const minutes = pad2(date.getMinutes());
  const seconds = pad2(date.getSeconds());
  return `atomic-service-demo-${year}${month}${day}-${hours}${minutes}${seconds}.txt`;
}

export function buildDownloadContent(date: Date): string {
  return [
    'AtomicServiceComponents 示例下载文件',
    `生成时间：${formatDateTime(date)}`,
    '组件：DownloadFileButton',
    '说明：该文件由 DocumentViewPicker 保存，选择器不可用时降级写入应用沙箱。'
  ].join('\n');
}
