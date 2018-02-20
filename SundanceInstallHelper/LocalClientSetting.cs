using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel;

namespace SundanceInstallHelper
{
    public enum SettingValueType
    {
        Undefined,
        Int,
        Bool,
        String,
        Point,
        Color
    }

    [Serializable]
    public class LocalClientSetting : INotifyPropertyChanged, ISetting
    {
        #region Fields

        int _Category;
        string _Attribute;
        SettingValueType _ValueType;
        string _Value;
        DateTime _LastUpdatedTime;

        #endregion

        #region Events

        public event PropertyChangedEventHandler PropertyChanged;

        protected void OnPropertyChanged(string propName)
        {
            if (PropertyChanged == null) return;
            PropertyChanged(this, new PropertyChangedEventArgs(propName));
        }

        #endregion

        #region Constructors

        /// <summary>
        /// Constructor
        /// </summary>
        public LocalClientSetting()
        {
        }

        #endregion

        #region Properties

        /// <summary>
        /// Unused
        /// </summary>
        public int ID { get { return 0; } }


        /// <summary>
        /// Gets or sets category
        /// </summary>
        public int Category
        {
            get { return _Category; }
            set
            {
                if (_Category == value) return;
                _Category = value;
                OnPropertyChanged("Category");
            }
        }

        /// <summary>
        /// Gets or sets attribute
        /// </summary>
        public string Attribute
        {
            get { return _Attribute; }
            set
            {
                if (_Attribute == value) return;
                _Attribute = value;
                OnPropertyChanged("Attribute");
            }
        }


        /// <summary>
        /// Gets or sets value.
        /// </summary>
        public string Value
        {
            get { return _Value; }
            set
            {
                if (_Value == value) return;
                _Value = value;
                OnPropertyChanged("Value");
            }
        }

        /// <summary>
        /// Gets or sets value type
        /// </summary>
        public SettingValueType ValueType
        {
            get { return _ValueType; }
            set
            {
                if (_ValueType == value) return;
                _ValueType = value;
                OnPropertyChanged("ValueType");
            }
        }

        public DateTime LastUpdatedTime
        {
            get { return _LastUpdatedTime; }
            set
            {
                if (_LastUpdatedTime == value) return;
                _LastUpdatedTime = value;
                OnPropertyChanged("LastUpdatedTime");
            }
        }

        #endregion
    }

    public interface ISetting
    {
        int ID { get; }
        string Attribute { get; set; }

        string Value { get; set; }
    }
}
