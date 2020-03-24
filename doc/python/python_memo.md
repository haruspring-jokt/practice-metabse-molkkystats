# Python関連メモ

MacでPythonを書くのは初めてに近い

## 環境構築

```bash
mkdir python
cd python
python3 -m venv env
source env/bin/activate.fish
pip3 install pandas

pip3 freeze > requiments.txt
```