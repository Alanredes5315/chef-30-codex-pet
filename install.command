#!/bin/zsh
set -euo pipefail

package_dir=${0:A:h}
codex_root=${CODEX_HOME:-${HOME}/.codex}
pet_target="${codex_root}/pets/chef-30"

for required_file in pet.json spritesheet.webp; do
  if [[ ! -f "${package_dir}/${required_file}" ]]; then
    echo "安装失败：缺少 ${required_file}"
    exit 1
  fi
done

needs_backup=false
if [[ -f "${pet_target}/pet.json" ]] && ! cmp -s "${package_dir}/pet.json" "${pet_target}/pet.json"; then
  needs_backup=true
fi
if [[ -f "${pet_target}/spritesheet.webp" ]] && ! cmp -s "${package_dir}/spritesheet.webp" "${pet_target}/spritesheet.webp"; then
  needs_backup=true
fi

if [[ "${needs_backup}" == true ]]; then
  backup_target="${codex_root}/pets/chef-30-backup-$(date +%Y%m%d-%H%M%S)"
  mkdir -p "${backup_target}"
  [[ -f "${pet_target}/pet.json" ]] && cp "${pet_target}/pet.json" "${backup_target}/pet.json"
  [[ -f "${pet_target}/spritesheet.webp" ]] && cp "${pet_target}/spritesheet.webp" "${backup_target}/spritesheet.webp"
  echo "已备份现有版本到：${backup_target}"
fi

mkdir -p "${pet_target}"
install -m 644 "${package_dir}/pet.json" "${pet_target}/pet.json"
install -m 644 "${package_dir}/spritesheet.webp" "${pet_target}/spritesheet.webp"

echo "Chef 30 v2.1 已安装到：${pet_target}"
echo "请在 Codex 中打开 Settings > Pets，点击 Refresh，选择 Chef 30；输入 /pet 可唤醒。"
echo "如果升级前宠物正在显示，请先用 /pet 收起，再用 /pet 唤醒以重新载入。"
echo
read -k 1 "?按任意键关闭…"
echo
