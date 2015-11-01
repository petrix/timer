////////////////////////////////////////////////////////////////////////////////
#include "editwindow.hpp"
#include "eventmodel.hpp"

#include <QMessageBox>

////////////////////////////////////////////////////////////////////////////////
EditWindow::EditWindow(QWidget* parent) : QWidget(parent),
    dialog(new QFileDialog(this))
{
    setupUi(this);

    sections->setModel(model);
    sections->setItemDelegateForColumn(Column::Time, &delegate);
    connect(sections->selectionModel(), &QItemSelectionModel::currentChanged, this, &EditWindow::update_current);

    connect(name, &QLineEdit::textChanged, model, &EventModel::set_name);
    connect(model, &EventModel::name_changed, name, &QLineEdit::setText);

    connect(model, &EventModel::filename_changed, this, &EditWindow::update_save);
    connect(model, &EventModel::name_changed, this, &EditWindow::update_save);
    connect(model, &EventModel::dataChanged, this, &EditWindow::update_save);
    connect(model, &EventModel::rowsRemoved, this, &EditWindow::update_save);

    connect(clear, &QToolButton::clicked, this, &EditWindow::clear_clicked);
    connect(open, &QToolButton::clicked, this, &EditWindow::open_clicked);
    connect(save, &QToolButton::clicked, this, &EditWindow::save_clicked);
    connect(save_as, &QToolButton::clicked, this, &EditWindow::save_as_clicked);

    QHeaderView* header = sections->horizontalHeader();
    header->setSectionResizeMode(Column::Num , QHeaderView::ResizeToContents);
    header->setSectionResizeMode(Column::Name, QHeaderView::Stretch);
    header->setSectionResizeMode(Column::Time, QHeaderView::ResizeToContents);

    dialog->setConfirmOverwrite(true);
    dialog->setDefaultSuffix("xml");
    dialog->setNameFilters(QStringList() << "Event files (*.xml)" << "All files (*)");

    connect(add, &QToolButton::clicked, this, &EditWindow::add_clicked);
    connect(insert, &QToolButton::clicked, this, &EditWindow::insert_clicked);
    connect(remove, &QToolButton::clicked, this, &EditWindow::remove_clicked);
    connect(up, &QToolButton::clicked, this, &EditWindow::up_clicked);
    connect(down, &QToolButton::clicked, this, &EditWindow::down_clicked);
}

////////////////////////////////////////////////////////////////////////////////
void EditWindow::clear_clicked()
{
    model->clear();

    name->setFocus();
    update_current(QModelIndex());
}

////////////////////////////////////////////////////////////////////////////////
void EditWindow::open_clicked()
try
{
    dialog->setFileMode(QFileDialog::ExistingFile);
    dialog->setAcceptMode(QFileDialog::AcceptOpen);

    if(dialog->exec() == QDialog::Accepted)
    {
        model->open(dialog->selectedFiles().at(0));

        name->setFocus();
        sections->setCurrentIndex(model->index(model->rowCount() - 1, Column::Name));
        save->setEnabled(false);
    }
}
catch(const QString& e)
{
    QMessageBox::critical(this, "Error", e);
}

////////////////////////////////////////////////////////////////////////////////
void EditWindow::save_clicked()
try
{
    model->save();

    save->setEnabled(false);
}
catch(const QString& e)
{
    QMessageBox::critical(this, "Error", e);
}

////////////////////////////////////////////////////////////////////////////////
void EditWindow::save_as_clicked()
try
{
    dialog->setFileMode(QFileDialog::AnyFile);
    dialog->setAcceptMode(QFileDialog::AcceptSave);

    if(dialog->exec() == QDialog::Accepted)
        model->save_as(dialog->selectedFiles().at(0));
}
catch(const QString& e)
{
    QMessageBox::critical(this, "Error", e);
}

////////////////////////////////////////////////////////////////////////////////
void EditWindow::update_save()
{
    save->setEnabled(model->filename().size());
    save_as->setEnabled(model->name().size() || model->rowCount());
}

////////////////////////////////////////////////////////////////////////////////
void EditWindow::update_current(const QModelIndex& current)
{
    bool valid = current.isValid();
    remove->setEnabled(valid);
    insert->setEnabled(valid);

    up->setEnabled(valid && current.row());
    down->setEnabled(valid && current.row() < model->rowCount(current.parent()) - 1);
}

////////////////////////////////////////////////////////////////////////////////
void EditWindow::add_clicked()
{
    if(model->insertRow(model->rowCount()))
    {
        sections->setFocus();
        sections->setCurrentIndex(model->index(model->rowCount() - 1, Column::Name));
    }
}

////////////////////////////////////////////////////////////////////////////////
void EditWindow::insert_clicked()
{
    auto index = sections->currentIndex();
    if(model->insertRow(index.row(), index.parent()))
    {
        sections->setFocus();
        sections->setCurrentIndex(model->index(index.row(), Column::Name, index.parent()));
    }
}

////////////////////////////////////////////////////////////////////////////////
void EditWindow::remove_clicked()
{
    auto index = sections->currentIndex();
    if(index.isValid()) model->removeRow(index.row(), index.parent());
}

////////////////////////////////////////////////////////////////////////////////
void EditWindow::up_clicked()
{
    auto index = sections->currentIndex();

    for(int column = Column::Name; column < Column::Size; ++column)
    {
        auto index1 = model->index(index.row(), column, index.parent());
        auto index2 = model->index(index.row() - 1, column, index.parent());

        QVariant value = model->data(index1, Qt::EditRole);
        model->setData(index1, index2.data(Qt::EditRole), Qt::EditRole);
        model->setData(index2, value, Qt::EditRole);
    }

    sections->setCurrentIndex(model->index(index.row() - 1, index.column(), index.parent()));
}

////////////////////////////////////////////////////////////////////////////////
void EditWindow::down_clicked()
{
    auto index = sections->currentIndex();

    for(int column = Column::Name; column < Column::Size; ++column)
    {
        auto index1 = model->index(index.row(), column, index.parent());
        auto index2 = model->index(index.row() + 1, column, index.parent());

        QVariant value = model->data(index1, Qt::EditRole);
        model->setData(index1, index2.data(Qt::EditRole), Qt::EditRole);
        model->setData(index2, value, Qt::EditRole);
    }

    sections->setCurrentIndex(model->index(index.row() + 1, index.column(), index.parent()));
}
