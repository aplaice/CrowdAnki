from unittest.mock import MagicMock, patch

from mamba import describe, it, context
from expects import expect, equal

from pathlib import Path

from crowd_anki.github.github_importer import GitImporter

GitImporter.get_repo_local_path = lambda self, x: Path("/tmp/foo/bar/")

with describe(GitImporter) as self:
    with context("user is trying to import a deck from a git repo multiple times"):
        with it("should clone the git repo without crashing"):
            collection_mock = MagicMock()
            subject = GitImporter(collection_mock)
            with patch("crowd_anki.github.github_importer.AnkiJsonImporter") as mock_json_importer:
                # Add sleeps?
                subject.clone_repository_and_import("https://github.com/aplaice/colemak_keyboard_layout_dynamic")
                subject.clone_repository_and_import("https://github.com/aplaice/colemak_keyboard_layout_dynamic")
                subject.clone_repository_and_import("https://github.com/aplaice/colemak_keyboard_layout_dynamic")
                # mock_json_importer.import_deck_from_path.assert_called_once()
                expect(mock_json_importer.import_deck_from_path.call_count).to(equal(3))
